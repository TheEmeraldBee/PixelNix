;;; Keywords
[
  "let"
  "if"
  "else"
  "for"
  "struct"
] @keyword

"fn" @keyword.function
"mut" @keyword

;;; Punctuation
[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
] @punctuation.bracket

[
  ","
  ";"
  ":"
] @punctuation.delimiter

;;; Operators
[
  "+"
  "-"
  "*"
  "/"
  "=="
  "!="
  "<"
  "<="
  ">"
  ">="
  "!"
  "."
  "="
  "->"
] @operator


;;; Literals
(number_literal) @number
(string_literal) @string

;;; Types
(struct_expression) @type.definition
(parameter
  type: (_) @type)
(function_expression
  return_type: (_) @type)
(array_expression
  type: (_) @type)
(init_struct_expression
  struct: (_) @type)

;;; Functions
;; Highlight the name in a `let` binding as a function if the value is a `fn`
(let_declaration
  name: (_) @function
  value: (function_expression))

(call_expression
  function: (_) @function.call)

;;; Variables and Properties
;; Highlight the name in a `let` binding as a variable (default)
(let_declaration
  name: (_) @variable)

(parameter
  name: (_) @variable.parameter)

(access_expression
  field: (_) @property)

(struct_field_definition
  field: (_) @property)

(struct_field_initializer
  field: (_) @property)

;;; General Identifiers
;; This is a fallback for identifiers that are not captured by more specific rules.
(identifier) @variable

;;; Comments
(line_comment) @comment
(block_comment) @comment

;;; Errors
(ERROR) @error
