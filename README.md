# IEL protokol (Typst)

Šablona a zdroj protokolu k projektu IEL, napsaný v [Typstu](https://typst.app).

## Struktura

- `src/index.typ` – hlavní soubor, vkládá jednotlivé příklady
- `src/fitiel.typ` – šablona dokumentu (stránka, písmo, nadpisy, titulní část) a zadání příkladů
- `src/01-pr1.typ` až `src/05-pr5.typ` – jednotlivé příklady; jako parametr se zadává skupina (A–H)
- `src/06-tab.typ` – souhrnná tabulka výsledků, skupiny se doplní automaticky
- `src/colors.typ` – barevná paleta
- `src/fig/` – obrázky a logo fakulty

## Použití

### S Nixem a direnv

1. Aktivujte prostředí:
```sh
direnv allow
```
2. Sestavte dokument:
```sh
make build
```

### Bez Nixu

Nainstalujte [Typst](https://github.com/typst/typst) (a volitelně `zathura`) a spusťte `make build`.

### Výsledek

Po sestavení je dokument v `target/index.pdf`. Otevření prohlížečem: `make open`.

## Editor

Pro našeptávání a kontrolu lze použít `tinymist` (LSP pro Typst), který je v Nix prostředí k dispozici.
