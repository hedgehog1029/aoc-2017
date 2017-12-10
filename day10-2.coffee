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

Number::toHexString = ->
    ('0' + this.toString(16)).substr(-2)

input = utils.input().trim()
list = [0..255]
pos = 0
skips = 0
globLengths = input.split("").map((s) -> s.charCodeAt(0)).concat [17, 31, 73, 47, 23]

runRound = (lengths) ->
    while !!lengths.length
        len = lengths.shift()
        if len > list.length
            console.warn("Invalid length: #{len}")
            continue
        
        unless len == 0
            list.circularReverse(pos, len)
        
        pos = (pos + len + skips) % list.length
        skips++

runRound(globLengths[..]) for i in [1..64]
denseHash = (list.splice(0, 16).reduce((a, j) -> a ^ j).toHexString() for i in [1..16]).join("")

utils.submit(denseHash)
