utils = require "./utils"

input = utils.read("day1.txt")
numbers = input.split("").map((item) -> parseInt(item))

state =
    i: 0
    peek: (j) ->
        while j >= numbers.length
            j = j - numbers.length

        numbers[j]
    incr: ->
        this.i++
    fw: ->
        this.i + (numbers.length / 2)

total = 0
while true
    numa = state.peek(state.i)
    numb = state.peek(state.fw())

    # console.log("#{numa} vs #{numb}")

    if numa == numb
        total += numa

    state.incr()
    if state.i == numbers.length
        break

console.log("Total: #{total}")
