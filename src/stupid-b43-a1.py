from itertools import combinations
from rich import print as pprint

SET = (
    "B",
    "O",
    "I",
    "S",
    "Q",
    "D",
)

if __name__ == "__main__":
    pprint(tuple(combinations(SET, 5)))
