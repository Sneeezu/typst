// Projekt z předmětu IEL
// Autor: (doplňte)

#import "fitiel.typ": fitiel

// Jazyk dokumentu: "cs" (čeština, implicitní), "sk" (slovenština), "en" (angličtina)
#show: fitiel.with(
  lang: "cs",
  title: "IEL - protokol k projektu",
  author: [Zbyněk, Šnajdar \ xsnajdz00],
)

#show outline.entry: set text(size: 13pt)
#outline(title: text(size: 16pt, weight: "bold")[Obsah])

#pagebreak()

// vložení jednotlivých příkladů
#include "01-pr1.typ"
#pagebreak()

#include "02-pr2.typ"
#pagebreak()

#include "03-pr3.typ"
#pagebreak()

#include "04-pr4.typ"
#pagebreak()

#include "05-pr5.typ"
#pagebreak()

// vložení tabulky s přehledem výsledků
#include "06-tab.typ"
