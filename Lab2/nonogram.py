from pysmt.shortcuts import *

msat = Solver(name="msat")

ancillas_index = 1
nonogram_column_hints = [2,3,4,2,2]
nonogram_row_hints = [2,3,3,(3,1),1]
nonogram_size = (len(nonogram_row_hints), len(nonogram_column_hints))

# Variables declaration, 1 for each item
vars = {}
for i in range(len(nonogram_row_hints)):
    for j in range(len(nonogram_column_hints)):
        vars["x{}{}".format(i,j)] = Symbol("x{}{}".format(i,j), BOOL)


def encode_three_one(index, ctype):
	if ctype == "r":
		msat.add_assertion(And(vars["x{}{}".format(index, 0)], vars["x{}{}".format(index, 1)], vars["x{}{}".format(index, 2)], Not(vars["x{}{}".format(index, 3)]), vars["x{}{}".format(index, 4)]))
	else:
		msat.add_assertion(And(vars["x{}{}".format(0, index)], vars["x{}{}".format(1, index)], vars["x{}{}".format(2, index)], Not(vars["x{}{}".format(3, index)]), vars["x{}{}".format(4, index)]))


#list_of_or.append(And([vars["x{}{}".format(index, i%size)] for i in range(i, i+hint)]+[Not(vars["x{}{}".format(index, i%size)]) for i in range(i+hint, i+size)]))
def encode_length(index, ctype, hint):
	size = nonogram_size[0] if ctype == "r" else nonogram_size[1] 
	list_of_or = []
	for i in range(0, size-hint+1):
		if ctype == "r":
            # metti true un range, metti falso tutto quello davanti al range, quando va fuori range ricomincia da capo fino al range
			list_of_or.append(And([vars["x{}{}".format(index, j)] for j in range(i, i+hint)]+[Not(vars["x{}{}".format(index, j%size)]) for j in range(i+hint, i+size)]))
		else:
			list_of_or.append(And([vars["x{}{}".format(j, index)] for j in range(i, i+hint)]+[Not(vars["x{}{}".format(j%size, index)]) for j in range(i+hint, i+size)]))	
	msat.add_assertion(Or(list_of_or))


for i in range(len(nonogram_row_hints)):
	hint = nonogram_row_hints[i]
	if hint == 2:
		encode_length(i, "r", 2)
	if hint == 3:
		encode_length(i, "r", 3)
	if hint == 4:
		encode_length(i, "r")
	if hint == (3,1):
		encode_three_one(i, "r")
	if hint == 1:
		encode_length(i, "r", 1)

for i in range(len(nonogram_column_hints)):
	hint = nonogram_column_hints[i]
	if hint == 2:
		encode_length(i, "c", 2)
	if hint == 3:
		encode_length(i, "c", 3)
	if hint == 4:
		encode_length(i, "c", 4)
	if hint == (3,1):
		encode_three_one(i, "c")
	if hint == 1:
		encode_length(i, "c", 1)

res = msat.solve()
if res:
	solution = list()
	sat_model = {el[0].symbol_name():el[1] for el in msat.get_model()}
	for i in range(0,nonogram_size[0]):
		row = ""
		for j in range(0,nonogram_size[1]):
			if sat_model["x{}{}".format(i,j)] == Bool(True):
				row += "*"
			else:
				row += " "
		solution.append(row)
	for line in solution:
		print(line)
else:
	print("UNSAT")
