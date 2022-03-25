# 1. The size 7 jersey is either Levy's jersey or the orange shirt.
# 2. Of the white jersey and the red shirt, one is a size 6 and the other is Jacobson's.
# 3. The orange jersey is either Kirby's jersey or the size 8 jersey.
# 4. Jacobson's shirt is larger than the white shirt.
# 5. Ingram's shirt is a size 9.

from pysmt.shortcuts import *

msat = Solver()

sizes = [6, 7, 8 ,9]
# Ingram, Jacobson, Kirby, Levy
players = ['i', 'j', 'k', 'l']
# blue, orange, red, white
colors = ['b', 'o', 'r','w']

size_players = {}
size_colors = {}

for n in sizes:
    for p in players:
        size_players["sp{}{}".format(n,p)] = Symbol("sp{}{}".format(n,p), BOOL)
    for c in colors:
        size_colors["sc{}{}".format(n,c)] = Symbol("sc{}{}".format(n,c), BOOL)

var = {** size_players, ** size_colors}

# for each size only one player and one color
for n in sizes:
    msat.add_assertion(ExactlyOne(var["sp{}{}".format(n,p)] for p in players))
    msat.add_assertion(ExactlyOne(var["sc{}{}".format(n,c)] for c in colors))
# for each player only one size
for p in players:
    msat.add_assertion(ExactlyOne(var["sp{}{}".format(n,p)] for n in sizes))
# for each color only one size
for c in colors:
    msat.add_assertion(ExactlyOne(var["sc{}{}".format(n,c)] for n in sizes))


# 1. The size 7 jersey is either Levy's jersey or the orange shirt.
msat.add_assertion(Or(var["sp7l"], var["sc7o"]))

# 2. Of the white jersey and the red shirt, one is a size 6 and the other is Jacobson's.
msat.add_assertion(Or(And(var["sc6w"], Or(And(var["sc7r"], var["sp7j"]), And(var["sc8r"], var["sp8j"]), And(var["sc9r"], var["sp9j"]))), And(var["sc6r"], Or(And(var["sc7w"], var["sp7j"]), And(var["sc8w"], var["sp8j"]), And(var["sc9w"], var["sp9j"])))))

# 3. The orange jersey is either Kirby's jersey or the size 8 jersey.
msat.add_assertion(Or(Or(And(var["sc6o"], var["sp6k"]), And(var["sc7o"], var["sp7k"]), And(var["sc8o"], var["sp8k"], And(var["sc9o"], var["sp9k"])))), (Or(And(var["sc8o"], var["sp8i"]), And(var["sc8o"], var["sp8j"]), And(var["sc8o"], var["sp8l"]))))

# 4. Jacobson's shirt is larger than the white shirt.
#white cant be size 9 and jacob cant be 6
msat.add_assertion(And(Not(var["sc9w"]), Not(var["sp6j"])))
#jacob 7 -> white 6
msat.add_assertion(Implies(var["sp7j"], var["sc6w"]))
#jacob 8 -> white 6 or 7
msat.add_assertion(Implies(var["sp8j"], Or(var["sc6w"], var["sc7w"])))
#jacob 9 -> white 6 or 7 or 8
msat.add_assertion(Implies(var["sp9j"], Or(var["sc6w"], var["sc7w"], var["sc8w"])))

# 5. Ingram's shirt is a size 9.
msat.add_assertion(var["sp9i"])
res = msat.solve()

if res:
    print("SATISFIABLE, model:")
    model = []
    for v in msat.get_model():
        if v[1] == Bool(True):
            model.append(v[0])
    print(model)
else:
    print("UNSATISFIABLE")


# Solution:
#     white 6 Levy
#     orange 7 kirby
#     red 8 jacob
#     blue 9 ingram

#msat.add_assertion(Not(And(var["sp6l"], var["sc6w"], var["sp7k"], var["sc7o"], var["sp8j"], var["sc8r"], var["sp9i"], var["sc9b"])))

# check if solution is unique:

solution = ["sp6l", "sc6w", "sp7k", "sc7o", "sp8j", "sc8r", "sp9i", "sc9b"]
msat.add_assertion(Not(And( var["{}".format(x)] for x in solution)))

res = msat.solve()

print("Solution unique?")
if res:
    print("No, here is another model:")
    model = []
    for v in msat.get_model():
        if v[1] == Bool(True):
            model.append(v[0])
    print(model)
else:
    print("Yes")