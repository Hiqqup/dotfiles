local mathzone = require("snippets.tex.mathzone");
local function math_autosnippet(trigger, snippet_string, input_table)
    return s({
        trig = trigger,
        snippetType = "autosnippet",
        condition = mathzone.in_mathzone
    }, fmta(snippet_string, input_table))
end


return {
    --operations
    math_autosnippet("//", "\\frac{<>}{<>}", { i(1), i(2), }), --fraction
    math_autosnippet("rd", "^{<>}", { i(1) }), --power
    math_autosnippet("sq", "\\sqrt{<>}", { i(1) }), -- square root
    math_autosnippet("sum", "\\sum_{<>}^{<>}", { i(1), i(2), }), --sum
    math_autosnippet("prod", "\\prod_{<>}^{<>}", { i(1), i(2), }), --sum
    math_autosnippet("log", "\\log_{<>}{<>}", { i(1), i(2), }), --log
    --misc
    math_autosnippet("br", "{<>}", { i(1), }), -- einfach gescheifete klammern handy
    math_autosnippet("_", "_{<>}", { i(1), }), -- index
    -- brackets
    math_autosnippet("cr", "\\{<>\\}", { i(1), }), -- gescheifete klammern 
    math_autosnippet("ar",  "[<>]", { i(1), }), -- eckige klammern
    math_autosnippet("kl",  "(<>)", { i(1), }), -- klammern
    math_autosnippet("gkl", "\\left(<>\\right)", { i(1), }), -- große klammern
    --suctures
    math_autosnippet("bb", "\\mathbb{<>}", { i(1), }), -- Fancy symbols
    math_autosnippet("tx", "\\text{<>}", { i(1), }), -- text 
    math_autosnippet("fl", "\\left\\lfloor <> \\right\\rfloor", { i(1), }), -- floor
    math_autosnippet("ci", "\\left\\lceil <> \\right\\rceil", { i(1), }), -- ciel
    --symbols
    math_autosnippet("in", "\\in", { }), -- ist element von
    math_autosnippet("fa", "\\forall", { }), -- for all
    math_autosnippet("ex", "\\exists", { }), -- exists
    math_autosnippet("em", "\\emptyset", { }), -- leere menge
    math_autosnippet("||", "\\lor", { }), -- oder
    math_autosnippet("!=", "\\neq", { }), -- !=
    math_autosnippet("!!", "\\not", { }), -- not
    math_autosnippet("<=", "\\leq", { }), -- <=
    math_autosnippet(">=", "\\geq", { }), -- >=
    math_autosnippet("&&", "\\land", { }), -- und
    math_autosnippet("sub", "\\subseteq", { }), -- teilmenge
    math_autosnippet("ng", "\\neg", { }), -- nicht
    math_autosnippet("ll", "\\Longleftrightarrow", { }), -- nicht
    math_autosnippet("imp", "\\implies", { }), -- implikatoion
    math_autosnippet("to", "\\to", { }), -- to 
    math_autosnippet("mid", "\\mid", { }), -- mid 
    math_autosnippet("xx", "\\times", { }), -- cross product
    math_autosnippet("cd", "\\cdot", { }), -- mal
    math_autosnippet("equiv", "\\equiv", { }), -- equiv
    --matrices
}
