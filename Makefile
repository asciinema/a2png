all: main.js page/page.js

main.js:
	lein cljsbuild once main

page/page.js:
	lein cljsbuild once page

.PHONY: all main.js page/page.js
