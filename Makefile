SRC=./src
OUT=./target

PDF_VIEWER=zathura
TYP_FILENAME=index.typ

.PHONY: all
all: build

.PHONY: build
build:
	@mkdir -p $(OUT)
	@typst compile $(SRC)/$(TYP_FILENAME) $(OUT)/$(basename $(TYP_FILENAME)).pdf

.PHONY: gc
gc:
	@rm -rf $(OUT)

.PHONY: open
open:
	@$(PDF_VIEWER) --fork $(OUT)/$(basename $(TYP_FILENAME)).pdf
