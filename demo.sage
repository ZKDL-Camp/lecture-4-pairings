from pairing import pairing, G1_GEN, G2_GEN, Fr

# First, verifying that pairing does work
assert pairing(2*G1_GEN, G2_GEN) == pairing(G1_GEN, 2*G2_GEN), 'Pairing does not work'
assert pairing(2*G1_GEN, 2*G2_GEN) == pairing(G1_GEN, G2_GEN)**4, 'Pairing does not work'

# Proving that y = x^2. Alice generates a correct tuple (x, y)
x = Fr.random_element()
y = x**2

assert x**2 == y, "Alice has an incorrect witness"

# Alice computes:
P1 = x * G1_GEN
P2 = x * G2_GEN
Q = y * G1_GEN

# Assume (P1, P2, Q) was sent to Bob. He wants to verify
# e(P1, P2) = e(Q, G2)

# What Bob sees:
print(f'Bob sees P1 = {P1}')
print(f'Bob sees P2 = {P2}')
print(f'Bob sees Q = {Q}')

# Actual verification:
assert pairing(P1, P2) == pairing(Q, G2_GEN), "Alice cheated!"
print("Bob is happy!")