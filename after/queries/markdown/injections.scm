; extends

((inline) @injection.content
  (#lua-match? @injection.content "^%s*import")
  (#set! injection.language "typescript"))

((inline) @injection.content
  (#lua-match? @injection.content "^%s*export")
  (#set! injection.language "typescript"))

((html_block) @injection.content
  (#lua-match? @injection.content "^%s*<")
  (#set! injection.language "tsx"))
