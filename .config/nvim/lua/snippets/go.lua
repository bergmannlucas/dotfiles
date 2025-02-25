local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("go", {
  s("iferr", {
    t({ "if err != nil {", "" }),
    i(1, " return"),
    t({ "", "}" }),
  }),
});
