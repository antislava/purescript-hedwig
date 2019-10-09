# A possible workflow (for building the library and examples):
# 0. shell-nix # providing: purs, spago, node, shab
# 1. make npm-deps
# 2. make purs-deps
# 3. make purs-build
# 4. make all-pages
# 5. make serve-HelloWorld

# Other: make ctags, make docs-html

EXMPLS := HelloWorld Counter Dice Prompt Counters AnimatedList Affjax JsFrameworkBenchmark

BLDS = $(EXMPLS:%=build-%)
SRVS = $(EXMPLS:%=serve-%)
JSS   = $(EXMPLS:%=./examples/%-page/parcel-index.js)
HTMLS = $(EXMPLS:%=./examples/%-page/index.html)
# WTCH = $(EXMPLS:%=watch-%) TODO

$(BLDS):
$(SRVS):
$(JSS):
$(HTMLS):


# Example HTML, JS, CSS from the respective templates

all-pages: $(HTMLS)

./examples/%-page/parcel-index.js:
	mkdir -p $(@D)
	env name=$* shab ./examples/parcel-index-template.js > $@

# Providing backups for html when overwriting
./examples/%-page/index.html: ./examples/%-page/parcel-index.js
	[[ -f $@ ]] && cp $@ $@.`date -u +%Y%m%d-%H%M%S` || \
		env name=$* shab ./examples/index-template.html > $@
	cp -n ./examples/style-template.css $(@D)/style.css
	cp -b -S .`date -u +%Y%m%d-%H%M%S`./examples/style-template.css $(@D)/style.css

clean-html-js-css-backups:
	rm -f ./examples/*-page/*{html,js,css}.20*


# Parcel wrapping

all-parcel: $(BLDS)

build-%: npm-deps purs-build
	node_modules/.bin/parcel build ./examples/$*-page/index.html -d ./dist/$*/

serve-%:
	node_modules/.bin/parcel serve ./examples/$*-page/index.html -d ./dist/$*/ -p 8080


# Purescript

repl:
	spago repl

purs-deps:
	spago install -j 8

purs-build:
	spago build

npm-deps: ./package.json
	npm install


# Tags and docs

ctags:
	purs docs --format ctags "src/**/*.purs" ".spago/*/*/src/**/*.purs"

docs-html:
	purs docs "src/**/*.purs" ".spago/*/*/src/**/*.purs"

docs-md:
	purs docs --format markdown "src/**/*.purs" ".spago/*/*/src/**/*.purs"

# Clean

clean-all: clean-dist clean-node
	rm -rf .cache
	rm -f  tags
	rm -rf generated-docs/


clean-dist:
	rm -rf ./dist

clean-node:
	rm -rf ./node_modules
