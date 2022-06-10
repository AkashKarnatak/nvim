; conditional
(if_statement
  consequence: (compound_statement . "{" . (_) @if_start @if_end (_)? @if_end . "}"
 (#make-range! "conditional.if" @if_start @if_end))
  alternative: (compound_statement . "{" . (_) @else_start @else_end (_)? @else_end . "}"
 (#make-range! "conditional.else" @else_start @else_end))
) @conditional.outer

; loops
(for_statement
  (_) ?
  (compound_statement . "{" . (_) @_start @_end (_)? @_end . "}"
 (#make-range! "loop.inner" @_start @_end))) @loop.outer
(while_statement
  (_) ?
  (compound_statement . "{" . (_) @_start @_end (_)? @_end . "}"
 (#make-range! "loop.inner" @_start @_end))) @loop.outer
(do_statement
  (_) ?
  (compound_statement . "{" . (_) @_start @_end (_)? @_end . "}"
 (#make-range! "loop.inner" @_start @_end))) @loop.outer
