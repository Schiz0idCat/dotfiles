local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("cw", {
        t("Console.Write("), i(0), t(");"),
    }),

    s("cwl", {
        t("Console.WriteLine("), i(0), t(");"),
    }),

    s("crl", {
        t("Console.ReadLine("), i(0), t(");"),
    }),

    s("if", {
        t("if ("), i(1, "condition"), t({ ")" }),
        t({ "", "{" }),
        t({ "\t", "\t" }),
        i(0),
        t({ "", "}" }),
    }),

    s("else", {
        t("else"),
        t({ "", "{" }),
        t({ "\t", "\t" }),
        i(0),
        t({ "", "}" }),
    }),


    s("elif", {
        t("else if ("), i(1, "condition"), t({ ")" }),
        t({ "", "{" }),
        t({ "\t", "\t" }),
        i(0),
        t({ "", "}" }),
    }),
}
