#import "colors.typ" as colors
#import "fitiel.typ": skupiny

= Shrnutí výsledků

// Skupiny se doplní automaticky z jednotlivých příkladů
#context {
  let vysledky = skupiny.final()
  table(
    columns: (auto, auto, 1fr),
    align: center + horizon,
    stroke: 0.5pt + colors.latte-overlay0,
    inset: 6pt,
    fill: (col, row) => if row == 0 { colors.latte-surface0 },
    table.header([*Příklad*], [*Skupina*], [*Výsledky*]),
    [1], [#vysledky.at("1")], [$U_(upright("R7")) =$ #h(2em) $I_(upright("R7")) =$],
    [2], [#vysledky.at("2")], [$U_(upright("R6")) =$ #h(2em) $I_(upright("R6")) =$],
    [3], [#vysledky.at("3")], [$U_(upright("R5")) =$ #h(2em) $I_(upright("R5")) =$],
    [4], [#vysledky.at("4")], [$|U_(C_2)| =$ #h(2em) $ϕ_(C_2) =$],
    [5], [#vysledky.at("5")], [$i_L =$],
  )
}
