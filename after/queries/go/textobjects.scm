; These are meant to complement nvim-treesitter-textobjects.
; https://github.com/nvim-treesitter/nvim-treesitter-textobjects

; Select an inner function without the braces.
; Thanks to https://github.com/RRethy/nvim-treesitter-textsubjects.
(function_declaration
  (block . "{" . (_) @_start @_end (_)? @_end . "}"
         (#make-range! "myfunction.inner" @_start @_end)))

(method_declaration
  (block . "{" . (_) @_start @_end (_)? @_end . "}"
         (#make-range! "myfunction.inner" @_start @_end)))

(func_literal
  (block . "{" . (_) @_start @_end (_)? @_end . "}"
         (#make-range! "myfunction.inner" @_start @_end)))

; Select an entire function plus any preceding comments.
((comment) @_start . (comment)* . (function_declaration) @_end
           (#make-range! "fullfunc" @_start @_end))

; Select an method declaration plus any preceding comments.
((comment) @_start . (comment)* . (method_declaration) @_end
           (#make-range! "fullfunc" @_start @_end))

