utils = require "./utils"

input = utils.read("day2.txt")
lines = input.split("\n")

total = 0
for line in lines
    row = line.split(/\s+/).map(Number)
    
    for numa, i in row
        for numb, j in row
            if i != j
                big = Math.max(numa, numb)
                small = Math.min(numa, numb)
                if big % small == 0
                    total += big / small

total = total / 2
console.log("Answer: #{total}")
