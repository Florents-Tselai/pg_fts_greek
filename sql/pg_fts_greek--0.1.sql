CREATE TEXT SEARCH CONFIGURATION greek_ext (
    COPY = greek
    );

CREATE TEXT SEARCH DICTIONARY greek_stopwords_dict (
    Template = snowball,
    Language = greek,
    Stopwords = greek
    );

ALTER TEXT SEARCH CONFIGURATION greek_ext
    ALTER MAPPING FOR asciiword, asciihword, hword_asciipart, hword, hword_part, word WITH greek_stopwords_dict;