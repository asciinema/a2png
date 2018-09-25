(ns asciinema.png.macros)

(defmacro <?
  "Actively throw an exception if something goes wrong when waiting on a channel message."
  [expr]
  `(asciinema.png.helpers/throw-err (cljs.core.async/<! ~expr)))
