utils = require "./utils"

input = utils.input().split(",")
pos = [0, 0, 0]
max = -1

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
    
    d = Math.max(pos.map(Math.abs)...)
    max = Math.max(d, max)

utils.submit(max)
