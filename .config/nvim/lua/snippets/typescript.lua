local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node

require("luasnip.loaders.from_lua").load({paths = vim.fn.stdpath("config") .. "/lua/snippets/javascript.lua"})

ls.add_snippets("typescript", {
  s("int", {
    t("interface "),
    i(1, "Name"),
    t({" {", "  "}),
    i(0),
    t({"", "}"}),
  }),

  s("type", {
    t("type "),
    i(1, "Name"),
    t(" = "),
    i(0),
    t(";"),
  }),

  s("fnt", {
    t("function "),
    i(1, "name"),
    t("("),
    i(2, "param: type"),
    t("): "),
    i(3, "ReturnType"),
    t({" {", "  "}),
    i(0),
    t({"", "}"}),
  }),

  s("aft", {
    t("const "),
    i(1, "name"),
    t(" = ("),
    i(2, "param: type"),
    t("): "),
    i(3, "ReturnType"),
    t({" => {", "  "}),
    i(0),
    t({"", "};"}),
  }),

  s("fng", {
    t("function "),
    i(1, "name"),
    t("<"),
    i(2, "T"),
    t(">("),
    i(3, "param: T"),
    t("): "),
    i(4, "T"),
    t({" {", "  "}),
    i(0),
    t({"", "}"}),
  }),

  s("class", {
    t("class "),
    i(1, "Name"),
    t({" {", "  constructor("}),
    i(2, "params"),
    t({") {", "    "}),
    i(3),
    t({"", "  }", "", "  "}),
    i(0),
    t({"", "}"}),
  }),

  s("enum", {
    t("enum "),
    i(1, "Name"),
    t({" {", "  "}),
    i(0),
    t({"", "}"}),
  }),

  s("impt", {
    t("import type { "),
    i(1, "Type"),
    t(" } from '"),
    i(2, "path"),
    t("';"),
  }),

  s("expt", {
    t("export type "),
    i(1, "Name"),
    t(" = "),
    i(0),
    t(";"),
  }),

  s("as", {
    i(1, "value"),
    t(" as "),
    i(2, "Type"),
  }),
}); 