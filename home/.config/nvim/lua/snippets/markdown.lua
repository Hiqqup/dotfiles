--gonna delete this later

local luasnip = require("luasnip");
return {
    -- A snippet that expands the trigger "hi" into the string "Hello, world!".
    luasnip.snippet(
        { trig = "hi" },
        { t("Hello, world!") }
    ),

    -- To return multiple snippets, use one `return` statement per snippet file
    -- and return a table of Lua snippets.
    luasnip.snippet(
        { trig = "foo" },
        { t("Another snippet.") }
    ),
}
