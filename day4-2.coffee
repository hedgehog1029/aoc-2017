utils = require "./utils"

input = utils.read("day4.txt")

valid = input.split("\n").filter((item) ->
    passwords = []
    item.split(/\s+/).every (v) ->
        ord = v.split("").sort().join("")
        if !!passwords.find((x) -> x.split("").sort().join("") == ord)
            return false
        
        !!passwords.push(v)
).length

console.log("#{valid} valid passphrases")
