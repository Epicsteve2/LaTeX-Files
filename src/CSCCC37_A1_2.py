import math
from decimal import Decimal

if __name__ == "__main__":
    for base in range(2, 10):
        print(
            """\\begin{center}
    \\begin{tabular}{|c|c|c|c|c|}
        \\hline \\cellcolor{gray!25}Multiplier &
        \\cellcolor{gray!25}Base &
        \\cellcolor{gray!25}Product &
        \\cellcolor{gray!25}Integral &
        \\cellcolor{gray!25}Fraction \\\\
        \\hline\\hline"""
        )
        knownFractions = set()
        multiplier = Decimal("0.1")
        while True:
            product = multiplier * Decimal(base)
            integral = math.floor(product)
            fraction = product - integral
            integral = Decimal(integral)
            print(
                f"""        \\texttt{{{multiplier}}} & \\texttt{{{base}}} & \\texttt{{{product}}} & \\texttt{{{integral}}} & \\texttt{{{fraction}}} \\\\\\hline"""
            )
            multiplier = Decimal(fraction)
            if fraction in knownFractions:
                break
            knownFractions.add(fraction)
        print(
            """    \end{tabular}
\end{center}"""
        )
