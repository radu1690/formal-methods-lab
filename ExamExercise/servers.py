from pysmt.shortcuts import *
solver = Solver()

RAM_servers = [2, 4, 4, 16, 8, 16, 16, 32, 8, 16, 8]
storage_servers = [100, 800, 1000, 8000, 3000, 6000, 4000, 2000, 1000, 10000, 1000]

RAM_vm = [1, 16, 4, 2, 4, 8, 2, 4, 16, 16, 12]
storage_vm = [100, 900, 710, 800, 7000, 4000, 800, 2500, 450, 3700, 1300]

server_vm = []
use_server = []
n_servers = Symbol("n_servers", INT)

# use pseudo boolean variables (0 and 1) to pair a server to vm
for s in range(len(RAM_servers)):
    ram_list = []
    for v in range(len(RAM_vm)):
        x = Symbol("srv{}vm{}".format(s,v), INT)
        solver.add_assertion(And(GE(x, Int(0))), LE(x, Int(1)))
        ram_list.append(x)
    server_vm.append(ram_list)

# pseudo boolean variables to mark used servers
for s in range(len(RAM_servers)):
    x = Symbol("use_server{}".format(s), INT)
    use_server.append(x)
    solver.add_assertion(And(GE(x, Int(0))), LE(x, Int(1)))

# only one server per vm
for v in range(len(RAM_vm)):
    tmp = []
    for s in range(len(RAM_servers)):
        tmp.append(server_vm[s][v])
    solver.add_assertion(Equals(Plus(tmp), Int(1)))


# assign ram/storage of server to vm
# 
for s in range(len(RAM_servers)):
    tmp_ram = []
    tmp_storage = []
    for v in range(len(RAM_vm)):
        tmp_ram.append(Times(server_vm[s][v], Int(RAM_vm[v])))
        tmp_storage.append(Times(server_vm[s][v], Int(storage_vm[v])))
    solver.add_assertion(LE(Plus(tmp_ram), Int(RAM_servers[s])))
    solver.add_assertion(LE(Plus(tmp_storage), Int(storage_servers[s])))

for s in range(len(RAM_servers)):
    tmp = []
    for v in range(len(RAM_vm)):
        tmp.append(Equals(server_vm[s][v], Int(1)))
    solver.add_assertion(Implies(Or(tmp), Equals(use_server[s], Int(1))))
    solver.add_assertion(Implies(Not(Or(tmp)), Equals(use_server[s], Int(0))))

tmp = []
for s in range(len(RAM_servers)):
    tmp.append(use_server[s])
solver.add_assertion(Equals(Plus(tmp), n_servers))

a = solver.solve()
# print(solver.get_model())

write_smtlib(And(solver.assertions), "servers.smt2")
    