utils = require "./utils"

Array::circularReverse = (start, end) ->
    end = end || @length
    slice = []
    
    j = 0
    while j < end
        i = (start + j) % @length
        slice.push(this[i])
        j++
    
    j = 0
    while j < end
        i = (start + j) % @length
        this[i] = slice.pop()
        j++
    @

input = utils.read("day10.txt")
list = [0..255]
pos = 0
skips = 0
lengths = input.split(",").map(Number)

while !!lengths.length
    len = lengths.shift()
    if len > list.length
        console.warn("Invalid length: #{len}")
        continue
    
    console.log("Pos #{pos}, length #{len}")
    unless len == 0
        list.circularReverse(pos, len)
    
    pos = (pos + len + skips) % list.length
    skips++

result = list[0] * list[1]
console.log("== RESULT: #{result}")
