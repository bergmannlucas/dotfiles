local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

ls.add_snippets("go", {
  s("iferr", {
    t({ "if err != nil {", "  " }),
    i(1, "return err"),
    t({ "", "}" }),
  }),

  s("func", {
    t("func "),
    i(1, "name"),
    t("("),
    i(2, "params"),
    t(") "),
    i(3, "returnType"),
    t({" {", "  "}),
    i(0),
    t({"", "}"}),
  }),

  s("meth", {
    t("func ("),
    i(1, "receiver"),
    t(" *"),
    i(2, "Type"),
    t(") "),
    i(3, "name"),
    t("("),
    i(4, "params"),
    t(") "),
    i(5, "returnType"),
    t({" {", "  "}),
    i(0),
    t({"", "}"}),
  }),

  s("struct", {
    t("type "),
    i(1, "Name"),
    t({" struct {", "  "}),
    i(0),
    t({"", "}"}),
  }),

  s("int", {
    t("type "),
    i(1, "Name"),
    t({" interface {", "  "}),
    i(0),
    t({"", "}"}),
  }),

  s("forr", {
    t("for "),
    i(1, "i"),
    t(", "),
    i(2, "v"),
    t(" := range "),
    i(3, "slice"),
    t({" {", "  "}),
    i(0),
    t({"", "}"}),
  }),

  s("test", {
    t("func Test"),
    i(1, "Name"),
    t("(t *testing.T) {"),
    t({"", "  "}),
    i(0),
    t({"", "}"}),
  }),

  s("handler", {
    t("func "),
    i(1, "handlerName"),
    t("(w http.ResponseWriter, r *http.Request) {"),
    t({"", "  "}),
    i(0),
    t({"", "}"}),
  }),

  s("make", {
    t("make([]"),
    i(1, "type"),
    t(", "),
    i(2, "0"),
    t(", "),
    i(3, "capacity"),
    t(")"),
  }),
});
