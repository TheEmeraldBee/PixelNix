/**
 * Creates a rule to match one or more of the rules separated by the separator.
 *
 * @param {RuleOrLiteral} rule
 * @param {RuleOrLiteral} sep - The separator to use.
 *
 * @returns {SeqRule}
 */
function sepBy1(rule, sep) {
  return seq(rule, repeat(seq(sep, rule)));
}

/**
 * Creates a rule to match zero or more of the rules separated by the separator.
 *
 * @param {RuleOrLiteral} rule
 * @param {RuleOrLiteral} sep - The separator to use.
 *
 * @returns {OptionalRule}
 */
function sepBy(rule, sep) {
  return optional(sepBy1(rule, sep));
}

const PREC = {
  assign: 0,
  or: 1,
  and: 2,
  compare: 3,
  add: 4,
  multiply: 5,
  unary: 6,
  call: 7,
};

module.exports = grammar({
  name: 'zel',

  extras: $ => [$.whitespace, $.line_comment, $.block_comment],

  supertypes: $ => [$._expression, $._statement],

  // Add the final conflict to the array.
  conflicts: $ => [
    [$._statement, $._atom],
    [$.array_expression, $.init_struct_expression],
    [$.array_expression, $.index_expression],
  ],

  rules: {
    program: $ => repeat($._statement),

    _statement: $ =>
      choice(
        $.let_declaration,
        $.expression_statement,
        $.if_expression,
        $.for_expression,
      ),

    expression_statement: $ => seq($._expression, ';'),

    _expression: $ =>
      choice(
        $.binary_expression,
        $.unary_expression,
        $._atom,
        $.call_expression,
        $.access_expression,
        $.index_expression,
        $.array_expression,
        $.init_struct_expression,
      ),

    _atom: $ =>
      choice(
        $.literal,
        $.identifier,
        $.if_expression,
        $.for_expression,
        $.function_expression,
        $.struct_expression,
        $.block,
        $.parenthesized_expression,
      ),

    let_declaration: $ =>
      seq(
        'let',
        optional('mut'),
        field('name', $.identifier),
        '=',
        field('value', $._expression),
      ),

    binary_expression: $ =>
      choice(
        prec.left(
          PREC.compare,
          seq(
            field('left', $._expression),
            field('operator', choice('==', '!=', '<', '<=', '>', '>=')),
            field('right', $._expression),
          ),
        ),
        prec.left(
          PREC.add,
          seq(
            field('left', $._expression),
            field('operator', choice('+', '-')),
            field('right', $._expression),
          ),
        ),
        prec.left(
          PREC.multiply,
          seq(
            field('left', $._expression),
            field('operator', choice('*', '/')),
            field('right', $._expression),
          ),
        ),
        prec.right(
          PREC.assign,
          seq(
            field('left', $.identifier),
            '=',
            field('right', $._expression),
          ),
        ),
      ),

    unary_expression: $ =>
      prec(
        PREC.unary,
        seq(field('operator', choice('-', '!')), field('operand', $._expression)),
      ),

    call_expression: $ =>
      prec(
        PREC.call,
        seq(field('function', $._expression), field('arguments', $.arguments)),
      ),
    access_expression: $ =>
      prec(
        PREC.call,
        seq(
          field('value', $._expression),
          '.',
          field('field', $.identifier),
        ),
      ),
    index_expression: $ =>
      prec(
        PREC.call,
        seq(
          field('value', $._expression),
          '[',
          field('index', $._expression),
          ']',
        ),
      ),
    array_expression: $ =>
      prec(
        PREC.call,
        seq(
          field('type', $._expression),
          '[',
          sepBy($._expression, ','),
          optional(','),
          ']',
        ),
      ),
    init_struct_expression: $ =>
      prec(
        PREC.call,
        seq(
          field('struct', $._expression),
          '[',
          sepBy($.struct_field_initializer, ','),
          optional(','),
          ']',
        ),
      ),

    struct_field_initializer: $ =>
      seq(field('field', $.identifier), ':', field('value', $._expression)),

    if_expression: $ =>
      seq(
        'if',
        field('condition', $._expression),
        field('consequence', $.block),
        optional(field('alternative', $.else_clause)),
      ),

    else_clause: $ => seq('else', choice($.block, $.if_expression)),

    for_expression: $ =>
      seq(
        'for',
        choice(
          seq(
            field('initializer', choice($.let_declaration, $._expression)),
            ';',
            field('condition', $._expression),
            ';',
            field('increment', $._expression),
          ),
          field('condition', $._expression),
        ),
        field('body', $.block),
      ),

    function_expression: $ =>
      seq(
        'fn',
        field('parameters', $.parameters),
        optional(seq('->', field('return_type', $._expression))),
        field('body', $.block),
      ),

    struct_expression: $ =>
      seq('struct', '{', sepBy($.struct_field_definition, ','), optional(','), '}'),

    struct_field_definition: $ =>
      seq(field('field', $.identifier), ':', field('type', $._expression)),

    block: $ =>
      seq(
        '{',
        repeat($._statement),
        optional(field('return_value', $._expression)),
        '}',
      ),

    parenthesized_expression: $ => seq('(', $._expression, ')'),

    arguments: $ =>
      seq('(', sepBy(field('argument', $._expression), ','), optional(','), ')'),
    parameters: $ =>
      seq('(', sepBy(field('parameter', $.parameter), ','), optional(','), ')'),
    parameter: $ =>
      seq(field('name', $.identifier), ':', field('type', $._expression)),

    literal: $ => choice($.number_literal, $.string_literal),
    identifier: $ => /[a-zA-Z_][a-zA-Z0-9_]*/,
    number_literal: $ => /\d+/,
    string_literal: $ => /"[^"]*"/,

    line_comment: $ => token(/\/\/[^\n]*/),
    block_comment: $ => token(/\/\*[\s\S]*?\*\//),
    whitespace: $ => token(/\s+/),
  },
});
