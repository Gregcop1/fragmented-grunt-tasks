module.exports =
  coffee:
    files: ['<%=gc.jsSrc %>/*.coffee']
    tasks: [
      'coffee:build'
      'uglify'
    ]