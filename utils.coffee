fs = require "fs"
http = require "http"

module.exports.read = (filename) ->
    fs.readFileSync("#{__dirname}/inputs/#{filename}", "utf8").trim()

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
