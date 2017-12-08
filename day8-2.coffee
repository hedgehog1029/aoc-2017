utils = require "./utils"

input = utils.read("day8.txt")
registers = {}
regex = /([a-z]+) (inc|dec) (-?\d+) if ([a-z]+) ([!<>=]+) (-?\d+)/

get = (key) ->
    if !this.hasOwnProperty(key)
        this[key] = 0
    this[key]

inc = (key, val) ->
    if !this.hasOwnProperty(key)
        this[key] = 0
    this[key] += val

dec = (key, val) ->
    if !this.hasOwnProperty(key)
        this[key] = 0
    this[key] -= val

Object.defineProperty(registers, "get", enumerable: false, value: get)
Object.defineProperty(registers, "inc", enumerable: false, value: inc)
Object.defineProperty(registers, "dec", enumerable: false, value: dec)

performAction = (action, adx, adv) ->
    switch action
        when "inc"
            registers.inc(adx, adv)
        when "dec"
            registers.dec(adx, adv)

max = -1
input.split("\n").forEach (line) ->
    match = regex.exec(line)

    if !match
        return console.warn("Non-matching instruction!")

    [_, adx, action, adv, cdx, comp, cdv] = match
    [adv, cdv] = [adv, cdv].map(Number)

    switch comp
        when ">"
            if registers.get(cdx) > cdv
                performAction(action, adx, adv)
        when "<"
            if registers.get(cdx) < cdv
                performAction(action, adx, adv)
        when ">="
            if registers.get(cdx) >= cdv
                performAction(action, adx, adv)
        when "<="
            if registers.get(cdx) <= cdv
                performAction(action, adx, adv)
        when "=="
            if registers.get(cdx) == cdv
                performAction(action, adx, adv)
        when "!="
            if registers.get(cdx) != cdv
                performAction(action, adx, adv)
    
    max = Math.max(i, max) for i in Object.keys(registers).map((k) -> registers[k])

console.dir(registers)

console.log("Max value: #{max}")
