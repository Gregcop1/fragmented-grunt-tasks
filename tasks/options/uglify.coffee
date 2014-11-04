module.exports =  
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