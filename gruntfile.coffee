'use strict'


loadConfig = (path)->
  glob = require('glob')
  object = {};

  glob.sync('*', {cwd: path}).forEach((option)->
    key = option.replace(/\.coffee$/,'')
    object[key] = require(path + option)
  )
  return object

registerTasks = (grunt, path)->
  glob = require('glob')
  object = [];
  glob.sync('*.coffee', {cwd: path}).forEach((option)->
    key = option.replace(/\.coffee$/,'')
    grunt.registerTask key, require(path + option)
  )

  return object

module.exports = (grunt) ->
  # charge toutes les modules de grunt
  require("load-grunt-tasks")(grunt)

  # stockage de la configuration dans une variable
  config = 
    pkg: grunt.file.readJSON('package.json')
    env: process.env
    gc:
      jsSrc  : 'assets/js/src'
      jsDest : 'assets/js'

  # on étend la configuration de base avec nos tâches d'execution
  grunt.util._.extend(config, loadConfig('./tasks/options/'));

  # on initialise la configuration stockée dans la variable config
  grunt.initConfig(config)

  # on demande l'enregistrement des tâches de lancement
  registerTasks(grunt, './tasks/')