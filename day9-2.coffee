utils = require "./utils"

input = utils.read("day9.txt").trim()
stream = input.split("")

garbage = false
score = 0
while !!stream.length
    char = stream.shift()
    
    if char == '!'
        stream.shift()
        continue
    
    if garbage
        score++
        if char == '>'
            garbage = false
            score--
        continue
    
    if char == '<'
        garbage = true

console.log("Score: #{score}")
