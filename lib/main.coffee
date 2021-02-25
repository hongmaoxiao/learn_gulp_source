async = require 'async'

module.exports = gulp =
  reset: ->
    glup.tasks = {}
    return @

  tasks: {}
  task: (name, fn) ->
    gulp.tasks[name] = fn
    return @

  run: (tasks...) ->
    for name in tasks
      fn = glup.tasks[name]
      throw new Error "No task nmed #{name}" unless fn?
      fn.call gulp
    return @

  #folder: require('./createFolderStream')
  files: require('./createFilesStream')
  #file: require('./createFileStream')

  # utils
  createGlobStream: require('./createGlobStream')