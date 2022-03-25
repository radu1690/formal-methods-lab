from pysmt.shortcuts import *

msat = Solver(name="msat")

# Model: one variable for each cell
# x00, x01, x02

n = 8
vars = {}
for i in range(0, n):
    for j in range(0, n):
        #print(str(i) +'-'+str(j))
        vars["x{}{}".format(i,j)] = Symbol("x{}{}".format(i,j), BOOL)

# one queen for each row
for i in range(0,n):
    msat.add_assertion(ExactlyOne(vars["x{}{}".format(i,j)] for j in range(0,n)))

# one queen for each column
for j in range(0,n):
    msat.add_assertion(ExactlyOne(vars["x{}{}".format(i,j)] for i in range(0,n)))

# one queen for each diagonal and sub-diagonal
#from left to right
for i in range(0, n):
    # i over rows
    formula = []
    y=i
    for x in range(0, n-i):
        formula.append(vars["x{}{}".format(y,x)])
        y+=1
    msat.add_assertion(AtMostOne(formula))
    # i over columns
    if i != 0:
        formula = []
        y=0
        for x in range(i, n):
            formula.append(vars["x{}{}".format(y,x)])
            y+=1
        msat.add_assertion(AtMostOne(formula))

#from right to left
for i in range(0, n):
    #i over columns
    formula = []
    y=0
    for x in reversed(range(0, i+1)):
        formula.append(vars["x{}{}".format(y,x)])
        y+=1
    msat.add_assertion(AtMostOne(formula))
    # i over rows
    formula = []
    y=i
    for x in reversed(range(i, n)):
        formula.append(vars["x{}{}".format(x,y)])
        y+=1
    msat.add_assertion(AtMostOne(formula))

# check if solution is unique
# this is the first solution that I got
solution = [
    ['0', '0', '0', '0', '0', 'X', '0', '0'],
    ['0', '0', '0', '0', '0', '0', '0', 'X'],
    ['0', 'X', '0', '0', '0', '0', '0', '0'],
    ['0', '0', '0', 'X', '0', '0', '0', '0'],
    ['X', '0', '0', '0', '0', '0', '0', '0'],
    ['0', '0', '0', '0', '0', '0', 'X', '0'],
    ['0', '0', '0', '0', 'X', '0', '0', '0'],
    ['0', '0', 'X', '0', '0', '0', '0', '0'],
]

and_list = []
for i in range(0,n):
    for j in range(0,n):
        if solution[i][j] == 'X':
            and_list.append(vars["x{}{}".format(i,j)])
msat.add_assertion(Not(And(and_list)))

res = msat.solve()
if res:
    print("SAT")
    model = {}
    # get all the variables from the model
    for element in msat.get_model():
        model[element[0].symbol_name()] = element[1]
    solution = list()
    #for each row
    for i in range(0,n):
        row = list()
        #for each column
        for j in range(0,n):
            if model["x{}{}".format(i,j)] == Bool(True):
                row.append("X")
            else:
                row.append("0")
        solution.append(row)
    for line in solution:
        print(line)
else:
    print("UNSAT")
    