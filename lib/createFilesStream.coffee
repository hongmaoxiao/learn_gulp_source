createGlobStream = require './createGlobStream'
es = require 'event-stream'
readFile = readFile './readFile'

module.exports = (glob, opt) ->
  globStream = createGlobStream glob, opt

  stream = globStream.pipe es.map readFile

  return stream