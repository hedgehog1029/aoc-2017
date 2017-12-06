utils = require "./utils"

find = (input) ->
    banks = input.split(/\s+/).map(Number)
    states = []
    k = 0

    while true
        ordo = banks.map((n, i) -> {n: n, i: i}).sort((a, b) ->
            if a.n == b.n
                return a.i - b.i
            b.n - a.n
        ).shift()
        blocks = ordo.n
        j = ordo.i
        banks[j] = 0

        while j < blocks + ordo.i
            j++
            banks[j % banks.length]++

        k++
        hash = banks.join(";")
        if states.indexOf(hash) > -1
            return k - (states.indexOf(hash) + 1)

        states.push(hash)

input = utils.read("day6.txt")
# input = "0 2 7 0"
console.log "Result: #{find(input)}"
