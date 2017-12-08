utils = require "./utils"

class Program
    constructor: (@name, @weight) ->
        @parent = null
        @children = []

    hasParent: ->
        !!@parent

    setParent: (parent) ->
        @parent = parent

    addChild: (child) ->
        @children.push(child)
        child.setParent(@)

    childrenWeight: ->
        @children.reduce ((a, b) -> a + b.totalWeight()), 0

    totalWeight: ->
        if @children.length == 0
            return @weight
        @weight + @childrenWeight()

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
        programs[parentName].addChild(programs[child])

root = programs[Object.keys(programs).find((prog) -> programs[prog].parent == null)]
console.log("Root program: #{root.name}")
console.log("Root weight: #{root.weight}")
console.log("Root children weight: #{root.childrenWeight()}")
console.log("Root total weight: #{root.totalWeight()}\n")

allWeights = (node) ->
    node.parent.children.map((c) -> c.totalWeight()).join(", ")

findCorrect = (node) ->
    min = { totalWeight: -> -1 }

    for i in node.children
        if i.totalWeight() == min.totalWeight()
            return i
        min = i

findOverweight = (node) ->
    max = node.children[0].totalWeight()
    overweight = null
    for i in node.children
        m = Math.max(i.totalWeight(), max)
        if m > max
            overweight = i
        max = m
    return overweight

child = root
while true
    c = findOverweight(child)
    if c == null
        break
        # no overweight nodes! therefore `child` is unbalanced

    console.log("Overweight node: #{c.name} (#{c.totalWeight()}) against (#{allWeights(c)})")

    if c.children.length == 0
        break
    child = c

correct = findCorrect(child.parent)
console.log("\n== Answer overweight node: #{child.name} at #{child.weight} total #{child.totalWeight()} (should be #{correct.totalWeight()})")
weight = child.weight - (child.totalWeight() - correct.totalWeight())
console.log("== Overweight node should be #{weight}")
