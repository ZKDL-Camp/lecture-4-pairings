# Lecture 4: Pairings

Repository containing Lecture 4 demonstration material

## :dart: Goal

Alice wants to verify to Bob that she knows such $x,y$ satisfying $y = x^2$ without  revealing $x$ or $y$. Given pairing $e: \mathbb{G}_1 \times \mathbb{G}_2 \to \mathbb{G}_T$, she does that by doing the following:

- Alice calculates $P_1 = [x]G_1$, $P_2 = [x]G_2$, $Q = [y]G_1$.
- Alice sends $(P_1, P_2, Q)$ to Bob.
- Bob verifies that $e(P_1,P_2) = e(Q, G_2)$.

## :books: Table of Contents

| # | File | Description |
|---|------|-------------|
| 1 | [pairings.py](pairing.sage) | Contains all the low-level implementation of pairing. |
| 2 | [demo.sage](demo.sage) | Demo itself. |
