from pysmt.shortcuts import *

msat = Solver(name="msat")

vars = {}
for i in range(1,6):
    for j in "abcde":
        vars["x{}{}".format(i,j)] = Symbol("x{}{}".format(i,j), BOOL)

formula = []

# Each guest exactly to one room:
for j in "abcde":
    msat.add_assertion(ExactlyOne(vars["x{}{}".format(i,j)] for i in range(1,6)))
    formula.append(ExactlyOne(vars["x{}{}".format(i,j)] for i in range(1,6)))
# For each room exactly one guest
for i in range(1,6):
    msat.add_assertion(ExactlyOne(vars["x{}{}".format(i,j)] for j in "abcde"))
    formula.append(ExactlyOne(vars["x{}{}".format(i,j)] for j in "abcde"))

conditions = [
    Or(vars["x1a"], vars["x2a"]),
    Or(vars["x2b"], vars["x4b"]),
    vars["x1c"],
    Or(vars["x2d"], vars["x4d"]),
    Or(vars["x1e"], vars["x5e"])
]

formula = And(formula)
write_smtlib(formula, "reserve.smt2")

for i in range(len(conditions)):
    msat.push()
    msat.add_assertion(conditions[i])
    res = msat.solve()
    if res:
        pass
    else:
        print("We can satisfy in order {} people".format(i))
        break

#msat.add_assertion(And(conditions))

print(msat.solve())