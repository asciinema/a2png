all: main.js page/page.js

main.js:
	lein cljsbuild once main

page/page.js:
	lein cljsbuild once page

test:
	./a2png.sh test/fixtures/welcome.json /tmp/a2png-test-v1.png 10 asciinema 2
	./a2png.sh test/fixtures/welcome.cast /tmp/a2png-test-v2.png 10 asciinema 2

.PHONY: all main.js page/page.js test
