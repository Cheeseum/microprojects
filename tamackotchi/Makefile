REPORTER = dot

all: build

build:
	@./node_modules/coffee-script/bin/coffee \
		-c \
		-o lib src

clean:
	rm -rf lib
	mkdir lib

watch:
	@./node_modules/coffee-script/bin/coffee \
		-o lib \
		-cw src
