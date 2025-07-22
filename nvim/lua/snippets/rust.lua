local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("struct", {
        t("struct "), i(1, "MyStruct"), t({ " {", "\t" }),
        i(0),
        t({ "", "}" }),
    }),
}
