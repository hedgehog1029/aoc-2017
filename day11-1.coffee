utils = require "./utils"

input = utils.input().split(",")
pos = [0, 0, 0]

while !!input.length
    move = input.shift()
    
    switch move
        when "n"
            pos[0]++
            pos[2]--
        when "s"
            pos[0]--
            pos[2]++
        when "ne"
            pos[0]++
            pos[1]--
        when "sw"
            pos[0]--
            pos[1]++
        when "nw"
            pos[1]++
            pos[2]--
        when "se"
            pos[1]--
            pos[2]++

console.log(pos)
pos = pos.map(Math.abs)
result = Math.max(pos...)
utils.submit(result)
