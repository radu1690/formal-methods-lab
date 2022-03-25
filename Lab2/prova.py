from pysmt.shortcuts import *

rows = [2,3,3, (3,1), 1]
columns = [2,3,4,2,2]
n_size = (len(rows), len(columns))
msat = Solver(name="msat")

vars = {}
for i in range(len(rows)):
    for j in range(len(columns)):
        vars["x{}{}".format(i,j)] = Symbol("x{}{}".format(i,j), BOOL)


def encode_length(index, ctype, hint):
    size = n_size[0] if ctype=='r' else n_size[1]
    list_of_or = []
    for i in range(0, size-hint+1):
        if ctype=='r':
            list_of_or.append(And([vars["x{}{}".format(index, j)] for j in range(i, i+hint)]+[Not(vars["x{}{}".format(index, j%size)]) for j in range(i+hint, i+size)]))
        else:
            list_of_or.append(And([vars["x{}{}".format(j, index)] for j in range(i, i+hint)]+[Not(vars["x{}{}".format(j%size, index)]) for j in range(i+hint, i+size)]))
    msat.add_assertion(Or(list_of_or))

def encode_three_one(index, ctype):
    if ctype=='r':
        msat.add_assertion(And(vars["x{}{}".format(index,0)], vars["x{}{}".format(index,1)], vars["x{}{}".format(index,2)], vars["x{}{}".format(index,4)], Not(vars["x{}{}".format(index,3)]), Not(vars["x{}{}".format(index,3)])))
    else:
        msat.add_assertion(And(vars["x{}{}".format(0,index)], vars["x{}{}".format(1,index)], vars["x{}{}".format(2,index)], vars["x{}{}".format(4,index)], Not(vars["x{}{}".format(3,index)]), Not(vars["x{}{}".format(3,index)])))
        

for i in range(len(rows)):
    if rows[i] == 1:
        encode_length(i, 'r', rows[i])
    if rows[i] == 2:
        encode_length(i, 'r', rows[i])
    if rows[i] == 3:
        encode_length(i, 'r', rows[i])
    if rows[i] == 4:
            encode_length(i, 'r', rows[i])
    if rows[i] == (3,1):
        encode_three_one(i, 'r')

for i in range(len(columns)):
    if columns[i] == 1:
        encode_length(i, 'c', columns[i])
    if columns[i] == 2:
        encode_length(i, 'c', columns[i])
    if columns[i] == 3:
        encode_length(i, 'c', columns[i])
    if columns[i] == 4:
            encode_length(i, 'c', columns[i])
    if columns[i] == (3,1):
        encode_three_one(i, 'c')
print(msat.solve())

model = {}
for element in msat.get_model():
        model[element[0].symbol_name()] = element[1]

# for i in range(len(rows)):
#     for j in range(len(columns)):
#         if model["x{}{}".format(i,j)] == Bool(True):
#             print("*", end="")
#         else:
#             print(" ", end="")
#     print("")

solution = list()
for i in range(len(rows)):
    row = ""
    for j in range(len(columns)):
        if model["x{}{}".format(i,j)] == Bool(True):
            row = row + "*"
        else:
            row = row + " "
    solution.append(row)

for line in solution:
    print(line)
