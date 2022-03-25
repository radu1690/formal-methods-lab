from pysmt.shortcuts import *

msat = Solver(name="msat")

# Model: number, row, column = 9*9*9 = 729 variables
# Number k in position i,j
vars = {"x{}{}{}".format(i,j,k): Symbol("x{}{}{}".format(i,j,k), BOOL) for i in range(1,10) for j in range(1,10) for k in range(1,10)}
# 0 = no number
sudoku_map = [	[0,0,5,0,0,0,1,0,0], 
				[0,0,0,4,9,2,0,0,0], 
				[9,0,0,0,0,0,0,0,3], 
				[0,3,0,0,0,0,0,6,0], 
				[0,9,0,0,0,0,0,1,0], 
				[0,2,0,0,0,0,0,7,0], 
				[1,0,0,0,0,0,0,0,8], 
				[0,0,0,6,8,7,0,0,0],
				[0,0,3,0,0,0,4,0,0]
            ]

# for each number
for k in range(1,10):
    # the number should appear once per row
    for i in range(1,10):
        msat.add_assertion(ExactlyOne(vars["x{}{}{}".format(i,j,k)] for j in range(1,10)))
    # the number should appear once per column
    for j in range(1,10):
        msat.add_assertion(ExactlyOne(vars["x{}{}{}".format(i,j,k)] for i in range(1,10)))
    # for each 3x3 subgrid the number should appear once
    for i in range(1,10,3): #i: from 1 to 10 with jumps of 3 (i = 0, 3, 6 )
        for j in range(1,10,3): #j: same as above
            msat.add_assertion(ExactlyOne(
                vars["x{}{}{}".format(i,j,k)],
                vars["x{}{}{}".format(i+1,j,k)],
                vars["x{}{}{}".format(i+2,j,k)],
                vars["x{}{}{}".format(i,j+1,k)],
                vars["x{}{}{}".format(i,j+2,k)],
                vars["x{}{}{}".format(i+1,j+1,k)],
                vars["x{}{}{}".format(i+1,j+2,k)],
                vars["x{}{}{}".format(i+2,j+1,k)],
                vars["x{}{}{}".format(i+2,j+2,k)],
            ))
    # the number should appear once per diagonal
    msat.add_assertion(ExactlyOne(vars["x{}{}{}".format(j,j,k)] for j in range(1,10)))
    msat.add_assertion(ExactlyOne(vars["x{}{}{}".format(j,10-j,k)] for j in range(1,10)))

for i in range(0,9):
    for j in range(0,9):
        if sudoku_map[i][j] != 0:
            # add the initial numbers
            msat.add_assertion(vars["x{}{}{}".format(i+1, j+1, sudoku_map[i][j])])
        else:
            # For each cell have a single number
            msat.add_assertion(ExactlyOne(vars["x{}{}{}".format(i+1, j+1 , k)] for k in range(1,10)))


res = msat.solve()
# pretty print
if res:
    print("SAT")
    model = {}
    # get all the variables from the model
    for element in msat.get_model():
        model[element[0].symbol_name()] = element[1]
    solution = list()
    #for each row
    for i in range(1,10):
        row = list()
        for j in range(1,10):
            #for each column
            for k in range(1,10):
                #for each number
                # get only the variables which are true
                if model["x{}{}{}".format(i,j,k)] == Bool(True):
                    row.append(k)
        solution.append(row)
    for line in solution:
        print(line)
else:
    print("UNSAT")
