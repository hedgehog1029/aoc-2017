utils = require "./utils"

input = utils.read("day2.txt")
lines = input.split("\n")

totals = for line in lines
    row = line.split(/\s+/).map(Number)
    max = -1
    min = Infinity
    [max, min] = [Math.max(i, max), Math.min(i, min)] for i in row
    max - min

grand = totals.reduce((a, c) -> a+c)
console.log("Answer: #{grand}")
