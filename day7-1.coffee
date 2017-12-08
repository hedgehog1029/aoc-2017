utils = require "./utils"

class Program
    constructor: (@name, @weight) ->
        @parent = null

    hasParent: ->
        !!@parent

    setParent: (parent) ->
        @parent = parent

input = utils.read("day7.txt")
programs = {}
orphans = {}
parser = /([a-z]+)\s\((\d+)\)(?: -> )?(.*)/
input.split("\n").forEach (item, i) ->
    result = parser.exec(item)

    if !result
        console.warn("Non-matching input at line #{i}.")

    [full, name, weight, childrenStr] = result
    weight = parseInt(weight)
    programs[name] = new Program(name, weight)

    unless childrenStr == ""
        children = childrenStr.split(", ")
        orphans[name] = children

Object.keys(orphans).forEach (parentName) ->
    children = orphans[parentName]
    children.forEach (child) ->
        programs[child].setParent(programs[parentName])

prog = Object.keys(programs).find((prog) -> programs[prog].parent == null)
console.log("Root program: #{prog}")
