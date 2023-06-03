EXTENSION = pg_fts_greek
DATA = sql/pg_fts_greek--0.1.sql
DATA_TSEARCH = greek.stop

INPUT_STOPWORDS_FILES = \
	nltk.greek.stop \
	./vendor/douros_greek_stopwords/lib/greek_stopwords/parts_of_speech/antonymies.txt \
	./vendor/douros_greek_stopwords/lib/greek_stopwords/parts_of_speech/arithmhtika.txt \
	./vendor/douros_greek_stopwords/lib/greek_stopwords/parts_of_speech/moria.txt \
	./vendor/douros_greek_stopwords/lib/greek_stopwords/parts_of_speech/protheseis.txt \
	./vendor/douros_greek_stopwords/lib/greek_stopwords/parts_of_speech/rhmata.txt \
	./vendor/douros_greek_stopwords/lib/greek_stopwords/parts_of_speech/syndesmoi.txt \
	./vendor/pmav99_greek_stopwords/stopwords.txt

# Fetch NLTK stopwords
nltk.stopwords.zip:
	curl "https://raw.githubusercontent.com/nltk/nltk_data/gh-pages/packages/corpora/stopwords.zip" --output $@

nltk.greek.stop: nltk.stopwords.zip
	unzip -p nltk.stopwords.zip stopwords/greek >$@

greek.stop: $(INPUT_STOPWORDS_FILES)
	cat $(INPUT_STOPWORDS_FILES) |\
	sed -e '/#/d' |\
	sed -e '/^[[:space:]]*$$/d' |\
	tr ' ' '\n' |\
	sort -u > $@

EXTRA_CLEAN = nltk.stopwords.zip nltk.greek.stop

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
