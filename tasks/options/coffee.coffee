module.exports =
  build:
    options:
      sourceMap: true
    expand: true
    flatten: true
    cwd: '<%= gc.jsSrc %>'
    src: '*.coffee'
    dest: '<%= gc.jsDest %>'
    ext: '.js'
