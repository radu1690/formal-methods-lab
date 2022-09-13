from pysmt.shortcuts import *

# 1. Of the film that grossed $5 million and the movie that grossed $8 million, one is Fast and Dead and the other was directed by Linda Lynch.
# 2. Amerigo made 3 million less than Fast and Dead.
# 3. Amerigo is either the film that grossed $2 million or the film directed by Nan Norman.
# 4. Of the film directed by Hick Harmon and the film that grossed $8 million, one is Easy to Love and the other is Fast and Dead.

# DIRECTORS: hick, linda, nan, odette
# MOVIES: amerigo, easy to love, fast and dead, what a world
# EARNINGS: 2, 5, 8 , 11

#MODELING: earning x movies, earnings x directors

msat = Solver()


er_movies = {} 
er_directors = {} 

movies = "aefw"
earnings = "2581"
directors = "hlno"

for i in earnings:
    for j in movies:
        er_movies["em{}{}".format(i,j)] = Symbol("em{}{}".format(i,j), BOOL)
    for j in directors:
        er_directors["ed{}{}".format(i,j)] = Symbol("ed{}{}".format(i,j), BOOL)

vars = {**er_movies, **er_directors}

# 5 and 8 milion: one is f movie and one is l director
msat.add_assertion(Or(And(vars["em5f"], vars["ed8l"]), And(vars["em8f"], vars["ed5l"])))
# a made 3 milions less than f
msat.add_assertion(Or(And(vars["em2a"], vars["em5f"]), And(vars["em5a"], vars["em8f"]), And(vars["em8a"], vars["em1f"])))
# a is either 2 or directed by n
msat.add_assertion(Or( And(vars["em2a"], Not(vars["ed2n"])), Or(And(vars["em5a"], vars["ed5n"],), And(vars["em8a"], vars["ed8n"]), And(vars["em1a"], vars["ed1n"]))))
# 8 m and director h : one is move e and one is movie f
msat.add_assertion(Or(And(vars["em8e"], Or(And(vars["em2f"], vars["ed2h"]), And(vars["em5f"], vars["ed5h"]), And(vars["em1f"], vars["ed1h"])))), And(vars["em8f"], Or(And(vars["em2e"], vars["ed2h"]), And(vars["em5e"], vars["ed5h"]), And(vars["em1e"], vars["ed1h"]))))

# for each movie
# for each director
# for each earning
for e in earnings:
    msat.add_assertion(ExactlyOne(vars["em{}{}".format(e, m)] for m in movies ))
    msat.add_assertion(ExactlyOne(vars["ed{}{}".format(e, d)] for d in directors ))

for m in movies:
    msat.add_assertion(ExactlyOne(vars["em{}{}".format(e, m)] for e in earnings))

for d in directors:
    msat.add_assertion(ExactlyOne(vars["ed{}{}".format(e, d)] for e in earnings))

res = msat.solve()

solution = msat.get_model()

print(res)

for el in solution:
    if el[1] == Bool(True):
        print(el[0])


# Solution
# 2 milion: amerigo - odette
# 5 milion: fast and dead - hick harmon
# 8 milion: easy to love - linda
# 11 milion: what a world -  n

msat.add_assertion(Not(And(vars["ed8l"], vars["em5f"], vars["em2a"], vars["ed1n"], vars["ed5h"], vars["em8e"], vars["ed2o"], vars["em1w"])))

unique = msat.solve()
print(unique)