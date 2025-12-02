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
}
