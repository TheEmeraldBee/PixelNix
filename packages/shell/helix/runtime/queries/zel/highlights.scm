;; Keywords
(const_declaration "const" @keyword)
(variable_declaration "let" @keyword)
(variable_declaration "mut" @keyword.modifier)
(function_expression "fn" @keyword)

;; Operators
(const_declaration "=" @operator)
(variable_declaration "=" @operator)
(assignment_statement "=" @operator)

(binary_expression
  operator: "*" @operator)
(binary_expression
  operator: "/" @operator)
(binary_expression
  operator: "+" @operator)
(binary_expression
  operator: "-" @operator)

;; Identifiers
(identifier) @variable.builtin
(const_declaration
  name: (identifier) @variable.constant)
(variable_declaration
  name: (identifier) @variable)
(parameters
  (identifier) @parameter)
(call_expression
  function: (expression) @function)

;; Literals
(number_literal) @number

;; Punctuation
(block "{" @punctuation.bracket)
(block "}" @punctuation.bracket)
(parameters "(" @punctuation.bracket)
(parameters ")" @punctuation.bracket)
(arguments "(" @punctuation.bracket)
(arguments ")" @punctuation.bracket)
(parenthesized_expression "(" @punctuation.delimiter)
(parenthesized_expression ")" @punctuation.delimiter)

;; Commas in parameter/argument lists
([
  (parameters (identifier) ("," @punctuation.delimiter))
  (arguments (expression) ("," @punctuation.delimiter))
])

;; Comments (assuming these are defined in your grammar and could appear in code)
(line_comment) @comment
(block_comment) @comment
