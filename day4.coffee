utils = require "./utils"

input = utils.read("day4.txt")

valid = input.split("\n").filter((item) ->
    passwords = []
    item.split(/\s+/).every (v, i, a) ->
        if passwords.indexOf(v) > -1
            return false
        
        !!passwords.push(v)
).length

console.log("#{valid} valid passphrases")
