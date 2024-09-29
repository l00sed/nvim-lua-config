; extends

((inline) @_inline (#lua-match? @_inline "^%s*import")) @nospell
((inline) @_inline (#lua-match? @_inline "^%s*export")) @nospell
((html_block) @_inline (#lua-match? @_inline "^%s*<")) @nospell
