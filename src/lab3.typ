#import "colors.typ" as colors

#let placeholder(label, height: 24mm) = block(
  width: 100%,
  height: height,
  inset: 8pt,
  stroke: 1pt + colors.latte-blue,
  radius: 4pt,
  fill: colors.latte-base,
  align(center + horizon)[
    #text(fill: colors.latte-blue, style: "italic")[Doplnit: #label]
  ],
)

= Cíl a použité prostředky

Cílem náhradního měření bylo stanovit voltampérovou charakteristiku
nelineární součástky a určit její pracovní bod. Použit byl zdroj 9 V,
potenciometr $R_"pot" = 250 "kΩ"$, sériový rezistor $R_S = 1 "kΩ"$, dioda
nebo LED a dva multimetry.

= Experiment 1 – nastavení napětí $U_0$

Potenciometrem nastavujeme napětí $U_0$ pro další experimenty. Voltmetr je
připojen mezi jezdec potenciometru a záporný pól zdroje.

#figure(
  image("fig/realistic-experiment-1.png", width: 100%),
  caption: [Zapojení experimentu 1.],
)

*Pozorování:* #placeholder("Doplňte rozsah nastaveného napětí a stručné pozorování.", height: 15mm)

= Experiment 2 – VA charakteristika diody

Ampérmetr je zapojen sériově s rezistorem $R_S$ a diodou. Voltmetr je
zapojen paralelně k diodě. Pro každou hodnotu $U_0$ zapište $U_N$ a $I_N$.

#figure(
  image("fig/realistic-experiment-2.png", width: 100%),
  caption: [Zapojení experimentu 2.],
)

#table(
  columns: 10,
  align: center + horizon,
  stroke: 0.5pt + colors.latte-overlay0,
  inset: 5pt,
  fill: (col, row) => if row == 0 { colors.latte-surface0 },
  table.header(
    [$U_0$ [V]], [0], [0,4], [0,8], [1,0], [1,5],
    [2,0], [3,0], [4,0], [5,0],
  ),
  [$U_N$ [V]], [], [], [], [], [], [], [], [], [],
  [$I_N$ [µA]], [], [], [], [], [], [], [], [], [],
)

#placeholder("Vložte graf VA charakteristiky $I_N = f(U_N)$.", height: 30mm)

= Experiment 3 – pracovní bod při $U_0 = 2,7 "V"$

Potenciometrem nastavte zadané napětí $U_0 = 2,7 "V"$. Z naměřených hodnot
určete pracovní bod $P_N = (U_P, I_P)$.

#figure(
  image("fig/realistic-experiment-3.png", width: 100%),
  caption: [Zapojení experimentu 3.],
)

$U_P = U_N =$ #placeholder("napětí na diodě", height: 10mm)

$I_P = I_N =$ #placeholder("proud diodou", height: 10mm)

= Vyhodnocení a závěr

#placeholder("Doplňte odpovědi k experimentům, popis tvaru VA charakteristiky a závěr.", height: 32mm)
