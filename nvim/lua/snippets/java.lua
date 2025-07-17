local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("class", {
        t("public class "), i(1, "MyClass"), t({ " {", "\tpublic static void main(String[] args) {" }),
        t({ "", "\t\t" }), i(0),
        t({ "", "\t}", "}" }),
    }),

    s("main", {
        t({ "public static void main(String[] args) {", "\t" }),
        i(0),
        t({ "", "}" }),
    }),

    s("if", {
        t("if ("), i(1, "condition"), t({ ") {", "\t" }),
        i(0),
        t({ "", "}" }),
    }),

    s("elif", {
        t("else if ("), i(1, "condition"), t({ ") {", "\t" }),
        i(0),
        t({ "", "}" }),
    }),

    s("else", {
        t({ "else {", "\t" }),
        i(0),
        t({ "", "}" }),
    }),

    s("for", {
        t("for ("), i(1, "int i = 0"), t("; "), i(2, "i < n"), t("; "), i(3, "i++"), t({ ") {", "\t" }),
        i(0),
        t({ "", "}" }),
    }),

    s("while", {
        t("while ("), i(1, "condition"), t({ ") {", "\t" }),
        i(0),
        t({ "", "}" }),
    }),

    s("do", {
        t({ "do {", "\t" }),
        i(0),
        t({ "", "} while (" }), i(1, "condition"), t(");"),
    }),

    s("switch", {
        t("switch ("), i(1, "expression"), t({ ") {", "\t" }),
        i(0),
        t({ "", "}" }),
    }),

    s("case", {
        t("case "), i(1, "value"), t(":"),
        t({ "", "\t" }), i(2),
        t({ "", "\tbreak;" }),
        t({ "", "" }), i(3)
    }),

    s("default", {
        t("default:"),
        t({ "", "\t" }),
        i(0),
    }),

    s("return", {
        t("return "), i(1, "expression"), t(";"),
    }),

    s("sol", {
        t("System.out.println("), i(1), t(");"), i(0),
    }),

    s("sot", {
        t("System.out.print("), i(1), t(");"), i(0),
    }),

    s("sof", {
        t('System.out.printf("'), i(1, "%d"), t('\\n", '), i(2), t(");"), i(0),
    }),
}
