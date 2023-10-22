return {
    s(
        { trig = "main" },
        fmt([[
                public static void main(String[] args){
                    <>
                }
                ]],
            { i(1) },
            { delimiters = "<>" }
        )
    ),
    s(
        { trig = "print" },
        { t("System.out.print("), i(1), t(");") }
    ),
}
