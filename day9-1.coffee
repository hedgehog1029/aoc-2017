utils = require "./utils"

input = utils.read("day9.txt").trim()
stream = input.split("")

garbage = false
openGroups = 0
score = 0
while !!stream.length
    char = stream.shift()
    
    if char == '!'
        stream.shift()
        continue
    
    if garbage
        if char == '>'
            garbage = false
        continue
    
    switch char
        when '{'
            openGroups++
        when '}'
            score += openGroups
            openGroups--
        when '<'
            garbage = true
        else
            continue

console.log("Score: #{score}")
