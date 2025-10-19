local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("class", {
        t("class "), i(1, "ClassName"), t({"{", ""}),
        t("    "), i(0, ""),
        t({ "", "}"}),
    }),

    s("function", {
        t("function "), i(1, ""), t("("), i(2, ""), t({") {", ""}),
        t("    "), i(0, ""),
        t({ "", "}" }),
    }),

    s("cl", {
        t("console.log("), i(0, ""), t(");"),
    }),

    s("if", {
        t("if ("), i(1, "condition"), t({") {", ""}),
        t("    "), i(0, ""),
        t({ "", "}"}),
    }),

    s("else", {
        t("else"), t({" {", ""}),
        t("    "), i(0, ""),
        t({ "", "}"}),
    }),

    s("elif", {
        t("else if ("), i(1, "condition"), t({") {", ""}),
        t("    "), i(0, ""),
        t({ "", "}"}),
    }),
}
