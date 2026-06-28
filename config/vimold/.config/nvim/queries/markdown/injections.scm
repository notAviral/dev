; extends

(fenced_code_block
  (info_string
    (language) @_lang
    (#eq? @_lang "rust"))
  (code_fence_content) @injection.content
  (#set! injection.language "rust"))
