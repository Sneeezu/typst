#let datum = "26. října 2026"

// Šablona pro projekt IEL
#import "colors.typ" as colors

// Skupiny zvolené v jednotlivých příkladech; souhrnná tabulka je čte přes .final()
#let skupiny = state("skupiny", (:))

// Šablona dokumentu: stránka, písmo, nadpisy a titulní část
#let fitiel(lang: "cs", title: "", author: [], body) = {
  set document(title: title)

  set page(
    paper: "a4",
    margin: (left: 2cm, right: 2cm, top: 3cm, bottom: 2.7cm),
    footer: context [
      #set text(size: 12pt, fill: colors.mocha-crust, weight: "bold")
      #align(center)[#counter(page).display("1")]
    ],
  )

  set text(
    font: "New Computer Modern",
    size: 11pt,
    lang: lang,
    fill: colors.mocha-crust,
  )
  set par(justify: true)

  show link: underline
  show link: set text(fill: blue)

  show heading.where(level: 1): element => block(
    width: 100%,
    below: 1em,
  )[
    #set text(size: 16pt)
    #element.body
    #line(
      length: 100%,
      stroke: (
        thickness: 1pt,
        paint: colors.mocha-crust,
        cap: "round",
      ),
    )
  ]

  align(
    center,
  )[
    #image(
      if lang == "en" { "fig/logo_en.png" } else { "fig/logo_cz.png" },
      width: if lang == "en" { 291pt } else { 270pt },
    )
    #v(1em)
    #text(size: 20pt, weight: "bold")[#title]
    #v(0.6em)
    #text(size: 13pt)[
      #author
      #v(0.4em)
      #datum
    ]
  ]
  v(1.5em)

  body
}

// Tabulka se zadáním: hlavička a řádek vybrané skupiny
#let zadani-tabulka(hlavicka, radky, skupina) = {
  set text(size: 9pt)
  let hodnoty = radky.at(skupina)
  table(
    columns: hlavicka.len(), align: center + horizon, stroke: 0.5pt
      + colors.latte-overlay0, inset: 5pt, fill: (col, row) => if row == 0 {
      colors.latte-surface0
    }, table.header(..hlavicka), ..(skupina, ..hodnoty).map(bunka => [#bunka]),
  )
}

// Příklad 1: napětí a proud U_R7, I_R7 (postupné zjednodušování)
#let zadani-1(skupina) = [
  #skupiny.update(stav => stav + ("1": skupina))

  Stanovte napětí $U_(upright("R7"))$ a proud $I_(upright("R7"))$. Použijte metodu
  postupného zjednodušování obvodu.

  #zadani-tabulka(
    (
      [sk.],
      [$U_1$ \[V\]],
      [$U_2$ \[V\]],
      [$R_1$ \[Ω\]],
      [$R_2$ \[Ω\]],
      [$R_3$ \[Ω\]],
      [$R_4$ \[Ω\]],
      [$R_5$ \[Ω\]],
      [$R_6$ \[Ω\]],
      [$R_7$ \[Ω\]],
      [$R_8$ \[Ω\]],
    ),
    (
      A: (80, 120, 350, 650, 410, 130, 360, 750, 310, 190),
      B: (95, 115, 650, 730, 340, 330, 410, 830, 340, 220),
      C: (100, 80, 450, 810, 190, 220, 220, 720, 260, 180),
      D: (105, 85, 420, 980, 330, 280, 310, 710, 240, 200),
      E: (115, 55, 485, 660, 100, 340, 575, 815, 255, 225),
      F: (125, 65, 510, 500, 550, 250, 300, 800, 330, 250),
      G: (130, 60, 380, 420, 330, 440, 450, 650, 410, 275),
      H: (135, 80, 680, 600, 260, 310, 575, 870, 355, 265),
    ),
    skupina,
  )

  #image("fig/Pr1.pdf", width: 288pt)
]

// Příklad 2: napětí a proud U_R6, I_R6 (Théveninova věta)
#let zadani-2(skupina) = [
  #skupiny.update(stav => stav + ("2": skupina))

  Stanovte napětí $U_(upright("R6"))$ a proud $I_(upright("R6"))$. Použijte metodu
  Théveninovy věty.

  #zadani-tabulka(
    (
      [sk.],
      [$U$ \[V\]],
      [$R_1$ \[Ω\]],
      [$R_2$ \[Ω\]],
      [$R_3$ \[Ω\]],
      [$R_4$ \[Ω\]],
      [$R_5$ \[Ω\]],
      [$R_6$ \[Ω\]],
    ),
    (
      A: (50, 525, 620, 210, 530, 50, 100),
      B: (100, 310, 610, 220, 570, 100, 50),
      C: (200, 220, 630, 240, 450, 200, 70),
      D: (150, 200, 660, 200, 550, 150, 200),
      E: (250, 335, 625, 245, 600, 300, 150),
      F: (130, 350, 600, 195, 650, 80, 180),
      G: (180, 315, 615, 180, 460, 120, 250),
      H: (220, 360, 580, 205, 560, 250, 190),
    ),
    skupina,
  )

  #image("fig/Pr2.pdf", width: 195pt)
]

// Příklad 3: napětí a proud U_R5, I_R5 (uzlová napětí)
#let zadani-3(skupina) = [
  #skupiny.update(stav => stav + ("3": skupina))

  Stanovte napětí $U_(upright("R5"))$ a proud $I_(upright("R5"))$. Použijte metodu
  uzlových napětí ($U_A$, $U_B$, $U_C$).

  #zadani-tabulka(
    (
      [sk.],
      [$U$ \[V\]],
      [$I_1$ \[A\]],
      [$I_2$ \[A\]],
      [$R_1$ \[Ω\]],
      [$R_2$ \[Ω\]],
      [$R_3$ \[Ω\]],
      [$R_4$ \[Ω\]],
      [$R_5$ \[Ω\]],
      [$R_6$ \[Ω\]],
    ),
    (
      A: (120, 0.5, 0.7, 530, 490, 650, 390, 320, 480),
      B: (150, 0.7, 0.8, 490, 450, 610, 340, 340, 550),
      C: (110, 0.9, 0.75, 440, 310, 560, 200, 300, 600),
      D: (115, 0.6, 0.9, 500, 380, 480, 370, 280, 450),
      E: (135, 0.2, 0.65, 520, 420, 520, 420, 210, 400),
      F: (145, 0.4, 0.85, 480, 440, 530, 360, 250, 700),
      G: (160, 0.35, 0.45, 460, 410, 540, 330, 290, 650),
      H: (130, 0.95, 0.5, 470, 390, 580, 280, 250, 350),
    ),
    skupina,
  )

  #image("fig/Pr3.pdf", width: 278pt)
]

// Příklad 4: fázory, U_C2 a ϕ_C2 (smyčkové proudy)
#let zadani-4(skupina) = [
  #skupiny.update(stav => stav + ("4": skupina))

  Pro napájecí napětí platí: $u_1 = U_1 ⋅ sin(2 π f t)$, $u_2 = U_2 ⋅ sin(2 π f t)$.
  \
  Ve vztahu pro napětí $u_(C_2) = U_(C_2) ⋅ sin(2 π f t + phi_(C_2))$ určete $|U_(C_2)|$ a $phi_(C_2)$.
  Použijte metodu smyčkových proudů.

  Pozn: Pomocné směry šipek napájecích zdrojů platí pro speciální časový okamžik ($t = frac(π, 2 ω)$).

  #zadani-tabulka(
    (
      [sk.],
      [$U_1$ \[V\]],
      [$U_2$ \[V\]],
      [$R_1$ \[Ω\]],
      [$R_2$ \[Ω\]],
      [$L_1$ \[mH\]],
      [$L_2$ \[mH\]],
      [$C_1$ \[μF\]],
      [$C_2$ \[μF\]],
      [$f$ \[Hz\]],
    ),
    (
      A: (3, 5, 120, 140, 120, 100, 200, 105, 70),
      B: (2, 4, 110, 150, 100, 85, 220, 95, 80),
      C: (3, 4, 100, 130, 220, 70, 230, 85, 75),
      D: (4, 5, 130, 150, 180, 90, 210, 75, 85),
      E: (5, 3, 140, 130, 130, 60, 100, 65, 90),
      F: (2, 3, 120, 100, 170, 80, 150, 90, 65),
      G: (5, 5, 130, 120, 140, 60, 160, 80, 60),
      H: (5, 6, 100, 100, 160, 75, 155, 70, 95),
    ),
    skupina,
  )

  #image("fig/Pr4.pdf", width: 161pt)
]

// Příklad 5: proud cívkou i_L(t) (diferenciální rovnice)
#let zadani-5(skupina) = [
  #skupiny.update(stav => stav + ("5": skupina))

  V obvodu na obrázku níže v čase $t = 0$ \[s\] sepne spínač $S$. Sestavte
  diferenciální rovnici popisující chování obvodu na obrázku, dále ji upravte
  dosazením hodnot parametrů. Vypočítejte analytické řešení $i_L = f(t)$. Proveďte
  kontrolu výpočtu dosazením do sestavené diferenciální rovnice.

  #zadani-tabulka(
    ([sk.], [$U$ \[V\]], [$L$ \[H\]], [$R$ \[Ω\]], [$i_L (0)$ \[A\]]),
    (
      A: (30, 5, 150, 1),
      B: (20, 2, 100, 2),
      C: (10, 4, 200, 5),
      D: (60, 3, 120, 3),
      E: (50, 5, 500, 4),
      F: (70, 10, 350, 7),
      G: (40, 8, 160, 6),
      H: (90, 5, 450, 8),
    ),
    skupina,
  )

  #image("fig/Pr5.pdf", width: 120pt)
]
