local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("javascript", {
  s("cl", {
    t("console.log("),
    i(1, "value"),
    t(");"),
  }),

  s("cll", {
    t("console.log('"),
    i(1, "label"),
    t(":', "),
    i(2, "value"),
    t(");"),
  }),

  s("fn", {
    t("function "),
    i(1, "name"),
    t("("),
    i(2, "params"),
    t(") {"),
    t({"", "  "}),
    i(0),
    t({"", "}"}),
  }),

  s("af", {
    t("const "),
    i(1, "name"),
    t(" = ("),
    i(2, "params"),
    t(") => {"),
    t({"", "  "}),
    i(0),
    t({"", "};"}),
  }),

  s("afl", {
    t("const "),
    i(1, "name"),
    t(" = ("),
    i(2, "params"),
    t(") => "),
    i(0),
    t(";"),
  }),

  s("try", {
    t({"try {", "  "}),
    i(1),
    t({"", "} catch ("}),
    i(2, "error"),
    t({") {", "  "}),
    i(0),
    t({"", "}"}),
  }),

  s("async", {
    t("async function "),
    i(1, "name"),
    t("("),
    i(2, "params"),
    t(") {"),
    t({"", "  "}),
    i(0),
    t({"", "}"}),
  }),

  s("promise", {
    t("new Promise((resolve, reject) => {"),
    t({"", "  "}),
    i(0),
    t({"", "});"}),
  }),

  s("imp", {
    t("import "),
    c(1, {
      { i(1, "module"), t(" from '"), i(2, "path"), t("'") },
      { t("{ "), i(1, "destructured"), t(" } from '"), i(2, "path"), t("'") },
    }),
    t(";"),
  }),

  s("exp", {
    t("export "),
    c(1, {
      { t("default "), i(1) },
      { t("{ "), i(1), t(" }") },
      { t("const "), i(1, "name"), t(" = "), i(2) },
    }),
    t(";"),
  }),

  s("us", {
    t("const ["),
    i(1, "state"),
    t(", set"),
    f(function(args)
      local state = args[1][1]
      return state:sub(1,1):upper() .. state:sub(2)
    end, {1}),
    t("] = useState("),
    i(2, "initialValue"),
    t(");"),
  }),

  s("ue", {
    t({"useEffect(() => {", "  "}),
    i(1),
    t({"", "}, ["}),
    i(2),
    t("]);"),
  }),
}); 