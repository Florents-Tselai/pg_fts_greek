greek_stop_words
----------------

This repo contains a list of modern greek "stop words". The original source of the list
can be found at `elarg-vl_fr.pdf`.

The list has been modified in the following ways:

1. When you copy paste the list from the pdf, something strange is going on with the
   letter "Δ". More specifically, even though it looks exactly the same, you can't e.g.
   convert it to lowercase. It seems that the unicode character is not the correct one
   (it's probably a symbol of some sort).  It has been replaced with the "correct" "Δ".
2. Fixed some obvious typos (e.g. 'λιγώτερο' -> 'λιγότερο').
2. Converted the list to lowercase
3. Created a copy of the original list and added accents (τόνους).
4. Merged the two lists (i.e. the one without the accents and the one with them).
5. Duplicated the words that end with "σ" and replace them with "ς". The duplication is
   necessary if we want the stem words to work with capital letters too.


The end result can be found at `greek.stop`.
