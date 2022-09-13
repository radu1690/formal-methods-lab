from pysmt.shortcuts import * 
msat = Solver()

day_company = {}
day_role = {}

roles = "cgrm" # copywriter, graphic design, sales rep, social media
companies = "alsi" # alpha plus, laneplex, sancode, streeter inc

for i in range(0,4):
    for j in companies:
        day_company["dc{}{}".format(i,j)] = Symbol("dc{}{}".format(i,j), BOOL)
    for j in roles:
        day_role["dr{}{}".format(i,j)] = Symbol("dr{}{}".format(i,j), BOOL)
vars = {**day_company, **day_role}

#alpha plus is 2 days before copywriter
msat.add_assertion(Or(And(vars["dc0a"], vars["dr2c"]), And(vars["dc1a"], vars["dr3c"])))
#graphic is sometime after sancode
msat.add_assertion(Or(And(vars["dc0s"], vars["dr1g"]), And(vars["dc0s"], vars["dr2g"]), And(vars["dc0s"], vars["dr3g"]),
            And(vars["dc1s"], vars["dr2g"]), And(vars["dc1s"], vars["dr3g"]), And(vars["dc2s"], vars["dr3g"])))
#sales rep and laneplex: one is 3, one is 0
msat.add_assertion(Or(And(vars["dc3l"], vars["dr0r"]), And(vars["dc0l"], vars["dr3r"])))
#dci 2 days before dca
msat.add_assertion(Or(And(vars["dc0a"], vars["dc2i"]), And(vars["dc1a"], vars["dc3i"])))
# no social media on 3
msat.add_assertion(Not(vars["dr3m"]))

for i in range(0,4):
    tmp_companies = []
    tmp_roles = []
    for j in companies:
        #msat.add_assertion(ExactlyOne)
        tmp_companies.append(day_company["dc{}{}".format(i,j)])
    msat.add_assertion(ExactlyOne(tmp_companies))
    for j in roles:
        tmp_roles.append(day_role["dr{}{}".format(i,j)])
    msat.add_assertion(ExactlyOne(tmp_roles))
msat.solve()

a = msat.get_model()
for el in a:
    if el[1] == Bool(True):
        print(el)

# solution is:
# 20: alpha plus sales rep
# 21: sancode social media
# 22: street inc copy writer
# 23: laneplex graphic designer


#checking if solution is unique

msat.add_assertion(Not(And(vars["dr2c"], vars["dc0a"], vars["dr3g"], vars["dc1s"], vars["dr0r"],
    vars["dc3l"], vars["dc2i"], vars["dr1m"])))

unique = msat.solve()

if unique:
    print("Unique")
else:
    print("Not unique")

# Solution is indeed unique
