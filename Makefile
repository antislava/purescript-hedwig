# Suggesed workflow (for building the library and the examples):
# 1. make npm-deps
# 2. make purs-deps
# 3. make purs-build
# 4. make all-pages
# 5. make serve-HelloWorld

EXMPLS := HelloWorld AnimatedList Affjax Counter Counters Dice JsFrameworkBenchmark Prompt

BLDS = $(EXMPLS:%=build-%)
SRVS = $(EXMPLS:%=serve-%)
JSS   = $(EXMPLS:%=./examples/%-page/parcel-index.js)
HTMLS = $(EXMPLS:%=./examples/%-page/index.html)
# WTCH = $(EXMPLS:%=watch-%) TODO

$(BLDS):
$(SRVS):
$(JSS):
$(HTMLS):


# Page templating

all-pages: $(HTMLS)

./examples/%-page/parcel-index.js:
	mkdir -p $(@D)
	env name=$* shab ./examples/parcel-index-template.js > $@

./examples/%-page/index.html: ./examples/%-page/parcel-index.js
	[[ -f $@ ]] && cp $@ $@.`date -u +%Y%m%d-%H%M%S` || \
		env name=$* shab ./examples/index-template.html > $@
	cp -n ./examples/style-template.css $(@D)/style.css


# Parcel wrapping

all-parcel: $(BLDS)

build-%: npm-deps purs-build
	node_modules/.bin/parcel build ./examples/$*-page/index.html -d ./dist/$*/

serve-%:
	node_modules/.bin/parcel serve ./examples/$*-page/index.html -d ./dist/$*/ -p 8080

purs-deps:
	spago install -j 8

purs-build:
	spago build

npm-deps: ./package.json
	npm install


clean-all: clean-dist clean-node
	rm -rf .cache

clean-dist:
	rm -rf ./dist

clean-node:
	rm -rf ./node_modules
