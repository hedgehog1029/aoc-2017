fs = require "fs"
http = require "http"
path = require "path"

module.exports.read = (filename) ->
    fs.readFileSync("#{__dirname}/inputs/#{filename}", "utf8").trim()

parseArgv = ->
    argf = process.argv.slice(2)
    parsed = {}
    
    i = 0
    while !!argf.length
        arg = argf.shift()
        
        if arg.startsWith("-")
            key = if arg[1] == '-' then arg.slice(2) else arg.slice(1)
            val = argf.shift()
            parsed[key] = val
        else
            parsed[i] = arg
            i++
    parsed

args = parseArgv()

module.exports.input = ->
    if args["input"]
        return module.exports.read(args["input"])
    else if args["input-text"]
        return args["input-text"]
    
    filename = path.basename(process.argv[1])
    day = filename.slice(0, filename.indexOf('-'))
    module.exports.read(day + ".txt")

module.exports.submit = (answer) ->
    if args["test"]
        console.log("// Testing answer: #{answer}")
        console.log("// Correct answer: #{args["test"]}")
        if answer.toString() == args["test"]
            console.log("\u001B[32m// Test passed!\u001B[39m")
        else
            console.log("\u001B[91m// Test failed!\u001B[39m")
    else
        console.log("\u001B[32m== Answer: #{answer}\u001B[39m")

module.exports.hastebin = (text, cb) ->
    req = http.request("https://hastebin.com/documents", method: "POST")

    req.on "response", (res) ->
        body = ""

        res.on "data", (chunk) ->
            body += chunk

        res.on "end", ->
            data = JSON.parse(body)
            cb("https://hastebin.com/#{data.key}.txt")

    req.write(text)
    req.end()
