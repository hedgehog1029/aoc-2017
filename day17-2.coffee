utils = require "./utils"

steps = parseInt(utils.input())
pos = 0
val = 0

for i in [1..50000001]
    pos = ((pos + steps) % i + 1)
    
    if pos == 1
        val = i

utils.submit(val)
