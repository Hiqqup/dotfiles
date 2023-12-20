return {
    s( "begin", fmta( [[
    \begin{<>}
        <>
    \end{<>}
    ]], { i(1), i(2), rep(1) })),

    s( "align", fmta( [[
      \begin{align}
          <>
      \end{align}
    ]], { i(1) })),
    --inline math
    s( "il", fmta( "$<>$" , { i(1) })),
}
