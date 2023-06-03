from pyuca import Collator

collator = Collator()

with open("stopwords.txt") as fd:
    stopwords = [line.strip() for line in fd.readlines()]

with open("tonoi.txt") as fd:
    tonoi = [line.strip() for line in fd.readlines()]

combined = list(set(tonoi + stopwords))

sigmas = [word[:-1] + "ς" for word in combined if word.endswith("σ")]

final = sorted(combined + sigmas, key=collator.sort_key)
# print(final[:30])
# print()
# print(final[-30:])

with open("greek.stop", "w") as fd:
    fd.write("\n".join(final))
