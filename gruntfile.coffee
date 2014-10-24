'use strict'

module.exports = (grunt) ->
  # load all grunt tasks
  require("load-grunt-tasks")(grunt)

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json')
    env: process.env
    gc:
      jsSrc  : 'assets/js/src'
      jsDest : 'assets/js'

    coffee:
      build:
        options:
          sourceMap: true
        expand: true
        flatten: true
        cwd: '<%= gc.jsSrc %>'
        src: '*.coffee'
        dest: '<%= gc.jsDest %>'
        ext: '.js'

    uglify: 
      options:
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */\n'
        sourceMap: true
      build:
        files: [
          expand: true
          cwd: '<%=gc.jsDest %>'
          src:  ['*.js', '!*.min.js']
          dest: '<%=gc.jsDest %>'
          ext: '.min.js'
        ]


    watch:
      coffee:
        files: ['<%=gc.jsSrc %>/*.coffee']
        tasks: [
          'coffee:build'
          'uglify'
        ]
  })

  grunt.registerTask('default', [
    'coffee:build'
    'uglify'
  ])

  grunt.registerTask('dev', [
    'coffee:build'
    'uglify'
    'watch'
  ])