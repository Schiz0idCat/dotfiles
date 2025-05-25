local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("#include", {
        t("#include <"), i(0), t(">")
    }),

    s("main", {
        t({ "int main() {", "\t" }),
        i(0),
        t({ "", "", "\treturn 0;", "}" })
    }),

    s("if", {
        t("if ("), i(1, "condition"), t({ ") {", "\t" }),
        i(0),
        t({ "", "}" }),
    }),

    s("else", {
        t({ "else {", "\t" }),
        i(0),
        t({ "", "}" }),
    }),

    s("switch", {
        t('switch ('), i(1, "condition"), t({ ') {', "\t" }),
        i(0),
        t({ "", "}" }),
    }),

    s("case", {
        t("case "), i(1, "condition"), t(":"),
        t({ "", "\t" }), i(2),
        t({ "", "\tbreak;" }),
        t({ "", "" }), i(3)
    }),

    s("default", {
        t("default:"),
        t({ "", "\t" }),
        i(0),
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

    s("return", {
        t("return "), i(1, "expresion"), t(";"),
    }),

    s("for", {
        t("for ("),
        i(1, "init-statement"), t("; "),
        i(2, "condition"), t("; "),
        i(3, "inc-expression"),
        t({ ") {", "\t" }),
        i(0),
        t({ "", "}" }),
    }),

    s("struct", {
        t("struct "), i(1, "MyStruct"), t({ " {", "\t" }),
        i(0),
        t({ "", "};" }),
    }),

    s("enum", {
        t("enum "), i(1, "myEnum"), t({ " {", "\t" }),
        i(0),
        t({ "", "};" }),
    }),

    s("printf", {
        t('printf("'),
        i(1, "%s"),
        t('\\n"'),
        i(2),
        t(");"),
        i(0),
    }),

    s("scanf", {
        t("scanf(\""), i(1, "%d"), t("\""), i(2), t(");"),
        i(0),
    }),
}
