# Postgres FTS Improvements for Greek

Packaged as an extension for now.

It adds another configuration `greek_ext` to be used like `to_tsvector('greek_ext', 'το κείμενο')`
instead of the vanilla `to_tsvector('greek', 'το κείμενο')`

The following sources ar used to create a `greek.stop` file which is then put under `prefix/share/tsearch_data`

- [NLTK Stopwords](https://raw.githubusercontent.com/nltk/nltk_data/gh-pages/packages/corpora/stopwords.zip)
- [pmav99/greek_stopwords](https://github.com/pmav99/greek_stopwords/tree/master)
- [dourosdimitris/greek_stopwords](https://github.com/dourosdimitris/greek_stopwords)

## Comparison

| t                                                        | to_tsvector('greek', t)                                                | to_tsvector('greek_ext', t)                               |
|----------------------------------------------------------|------------------------------------------------------------------------|-----------------------------------------------------------|
| 'το τετράγωνο της υποτείνουσας ενός ορθογωνίου τριγώνου' | 'εν':5 'ορθογων':6 'τ':3 'τετραγων':2 'το':1 'τριγων':7 'υποτεινουσ':4 | 'εν':5 'ορθογων':6 'τετραγων':2 'τριγων':7 'υποτεινουσ':4 |
| 'ο γιώργος είναι πονηρός'                                | 'γιωργ':2 'εινα':3 'ο':1 'πονηρ':4                                     | 'γιωργ':2 'πονηρ':4                                       |
| 'ο ήλιος ο πράσινος o ήλιος που ανατέλλει'               | 'o':5 'ανατελλ':8 'ηλι':2,6 'ο':1,3 'π':7 'πρασιν':4                   | 'ανατελλ':8 'ηλι':2,6 'πρασιν':4                          |

## Installation

```shell
git submodule init

make greek.stop
make install

psql -c "CREATE EXTENSION pg_fts_greek"
```
