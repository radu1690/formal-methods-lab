from pysmt.shortcuts import *

RAM_servers = [2, 4, 4, 16, 8, 16, 16, 32, 8, 16, 8]
storage_servers = [100, 800, 1000, 8000, 3000, 6000, 4000, 2000, 1000, 10000, 1000]

RAM_vm = [1, 16, 4, 2, 4, 8, 2, 4, 16, 16, 12]
storage_vm = [100, 900, 710, 800, 7000, 4000, 800, 2500, 450, 3700, 1300]

msat = Solver()









res = msat.solve()


print("done")