from pairing import pairing, G1_GEN, G2_GEN, Fr

assert pairing(2*G1_GEN, G2_GEN) == pairing(G1_GEN, 2*G2_GEN), 'Whut 1'
assert pairing(2*G1_GEN, 2*G2_GEN) == pairing(G1_GEN, G2_GEN)**4, 'Whut 2'

# Proving that x**2 = y
x = Fr.random_element()
y = x**2

assert x**2 == y, "Alice has incorrect witness"

# Alice computes:
P1 = x * G1_GEN
P2 = x * G2_GEN
Q = y * G2_GEN

# Assume (P1, P2, Q) was sent to Bob. He wants to verify
# e(P1, P2) = e(G1, Q)

# What Bob sees:
print(f'Bob sees P1 = {P1}')
print(f'Bob sees P2 = {P2}')
print(f'Bob sees Q = {Q}')

# Actual verification:
assert pairing(P1, P2) == pairing(G1_GEN, Q), "Alice cheated!"
print("Bob is happy!")