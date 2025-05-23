module.exports = grammar({
  name: 'zel',

  extras: $ => [
    $.whitespace,
    $.line_comment,
    $.block_comment,
  ],

  inline: $ => [],

  supertypes: $ => [],

  rules: {
    program: $ => repeat($.const_declaration),

    const_declaration: $ => seq(
      'const',
      field('name', $.identifier),
      '=',
      field('value', $.expression)
    ),

    variable_declaration: $ => seq(
      'let',
      optional('mut'),
      field('name', $.identifier),
      '=',
      field('value', $.expression)
    ),

    assignment_statement: $ => seq(
      field('left', $.identifier),
      '=',
      field('right', $.expression)
    ),

    expression: $ => choice(
        $.binary_expression,
        $.call_expression,
        $.function_expression,
        $.identifier,
        $.number_literal,
        $.parenthesized_expression,
        $.block
    ),

    binary_expression: $ => choice(
        prec.left(2, seq(
            field('left', $.expression),
            field('operator', choice('*', '/')),
            field('right', $.expression)
        )),
        prec.left(1, seq(
            field('left', $.expression),
            field('operator', choice('+', '-')),
            field('right', $.expression)
        ))
    ),

    call_expression: $ => seq(
        field('function', $.expression),
        field('arguments', $.arguments)
    ),

    function_expression: $ => seq(
        'fn',
        field('parameters', $.parameters),
        field('body', $.block)
    ),

    block: $ => seq(
      '{',
      optional(seq(
        sepBy(';', choice(
          $.variable_declaration,
          $.assignment_statement,
          $.expression,
        )),
        optional(';')
      )),
      '}'),
    

    parameters: $ => seq('(', optional(seq(
        field('parameter', $.identifier),
        repeat(seq(',', field('parameter', $.identifier))),
        optional(',')
    )), ')'),

    arguments: $ => seq('(', optional(seq(
        field('argument', $.expression),
        repeat(seq(',', field('argument', $.expression)))
    )), ')'),

    parenthesized_expression: $ => seq('(', $.expression, ')'),

    identifier: $ => /[a-zA-Z_][a-zA-Z0-9_]*/,
    number_literal: $ => /\d+(\.\d*)?/,

    line_comment: $ => token(/\/\/[^\n]*/),
    block_comment: $ => token(/\/\*[\s\S]*?\*\//),
    whitespace: $ => token(/\s+/),
  }
});

/**
 * Creates a rule to match one or more of the rules separated by the separator.
 *
 * @param {RuleOrLiteral} sep - The separator to use.
 * @param {RuleOrLiteral} rule
 *
 * @returns {SeqRule}
 */
function sepBy(sep, rule) {
  return seq(rule, repeat(seq(sep, rule)));
}
