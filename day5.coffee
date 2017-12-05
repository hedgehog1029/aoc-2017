utils = require "./utils"

input = utils.read("day5.txt")
maze = input.split("\n").map(Number)

i = 0
j = 0
while i < maze.length
    jump = maze[i]++
    i += jump
    j++

console.log("Steps: #{j} (i = #{i})")
