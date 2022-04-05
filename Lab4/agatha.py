from pysmt.shortcuts import *

msat = Solver(name="msat")

n=3
agatha = Int(0)
butler = Int(1)
charles = Int(2)

people = ["agatha", "butler", "charles"]
killer = Symbol("killer", INT)
victim = agatha

# FunctionType(<Output_type> [input1_type, input2_type, ...])
fu = FunctionType(BOOL, [INT, INT])

hates = Symbol("hates", fu)
richer = Symbol("richer", fu)

# since the possible killers are agatha(0), butler(1), charles(2): the killer is 0, 1 or 2
msat.add_assertion(And(GE(killer, agatha), LE(killer, charles)))

# killer hates his victim
msat.add_assertion(Function(hates, [killer, victim]))

# killer is not richer than victim
msat.add_assertion(Not(Function(richer, [killer, victim])))

# charles hates no one that agatha hates
for i in range(0,n):
    msat.add_assertion(Implies(Function(hates, [agatha, Int(i)]), Not(Function(hates, [charles, Int(i)]))))

# agatha hates everyone except the butler
for i in range(0, n):
    if Int(i) != butler:
        msat.add_assertion(Function(hates, [agatha, Int(i)]))
    else:
        msat.add_assertion(Not(Function(hates, [agatha, Int(i)])))

# the butler hates everyone not richer than agatha
for i in range(0, n):
    msat.add_assertion(Implies(Not(Function(richer, [Int(i), agatha])), Function(hates, [butler, Int(i)])))

# the butler hates everyone agatha hates
for i in range(0, n):
    msat.add_assertion(Implies(Function(hates, [agatha, Int(i)]), Function(hates, [butler, Int(i)])))

# no one hates everyone
for i in range(0, n):
    msat.add_assertion(Plus(Ite(Function(hates, [Int(i), Int(j)]), Int(1), Int(0)) for j in range(0, n)) < Int(3))

# no one is richer than himself
for i in range(0, n):
    msat.add_assertion(Not(Function(richer, [Int(i), Int(i)])))

# if a is richer than b, then b is not richer than a
for a in range(0, n):
    for b in range(0, n):
        if a!=b:
            msat.add_assertion(Implies(Function(richer, [Int(a), Int(b)]), Not(Function(richer, [Int(b), Int(a)]))))

result = msat.solve()

if result:
    print("SAT")
    for el in msat.get_model():
        print(el)