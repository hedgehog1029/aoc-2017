utils = require "./utils"
coffee = require "coffeescript"
vm = require "vm"

input = utils.read("day8.txt")
context = vm.createContext()
program = input.replace(/inc/g, "+=").replace(/dec/g, "-=").replace(/^([a-z]+)\s/gm, "$1 = $1 || 0; $1")
coffee.eval(program, sandbox: context)

exclude = ["GLOBAL", "root", "global", "__filename", "__dirname"]
registers = Object.keys(context).filter((k) -> exclude.indexOf(k) < 0)
max = -1
max = Math.max(context[k], max) for k in registers

console.log("Max value: #{max}")
