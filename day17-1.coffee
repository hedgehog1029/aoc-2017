utils = require "./utils"

steps = parseInt(utils.input())
state = [0]
pos = 0

for i in [1..2017]
    ps = ((pos + steps) % state.length) + 1
    state.splice(ps, 0, i)
    pos = ps

console.log("Index of 0: #{state.indexOf(0)}, value after 0: #{state[state.indexOf(0) + 1]}")
utils.submit(state[pos + 1])
