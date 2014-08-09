'use strict'

paths =
    temp:              'public/tmp/'
    components:        'public/components/'
    vendor:            'public/vendor/'
    vendorScripts:     'public/vendor/scripts/'
    vendorStylesheets: 'public/vendor/stylesheets/'
    vendorFonts:       'public/vendor/fonts/'
    appBuild:          'public/app/build/'
    appScripts:        'public/app/scripts/'
    appStylesheets:    'public/app/stylesheets/'
    commonBuild:       'public/common/build'
    commonScripts:     'public/common/scripts'
    commonStylesheets: 'public/common/stylesheets'

copyTasks =
    jquery:
        src: paths.components + 'jquery/dist/jquery.min.js'
        dest: paths.vendorScripts
        flatten: true, expand: true
    jquery_ui:
        src: paths.components + 'jquery-ui/jquery-ui.min.js'
        dest: paths.vendorScripts
        flatten: true, expand: true
    angular:
        src: paths.components + 'angular/angular.min.js'
        dest: paths.vendorScripts
        flatten: true, expand: true
    angular_sanitize:
        src: paths.components + 'angular-sanitize/angular-sanitize.min.js'
        dest: paths.vendorScripts
        flatten: true, expand: true
    angular_ui_router:
        src: paths.components + 'angular-ui-router/release/angular-ui-router.min.js'
        dest: paths.vendorScripts
        flatten: true, expand: true
    bootstrap_js:
        src: paths.components + 'bootstrap/dist/js/bootstrap.min.js'
        dest: paths.vendorScripts
        flatten: true, expand: true
    bootstrap_css:
        src: paths.components + 'bootstrap/dist/css/bootstrap.min.css'
        dest: paths.vendorStylesheets
        flatten: true, expand: true
    bootstrap_fonts:
        src: paths.components + 'bootstrap/dist/fonts/*'
        dest: paths.vendorFonts
        flatten: true, expand: true
    fontawesome_css:
        src: paths.components + 'fontawesome/css/font-awesome.min.css'
        dest: paths.vendorStylesheets
        flatten: true, expand: true
    fontawesome_fonts:
        src: paths.components + 'fontawesome/fonts/*'
        dest: paths.vendorFonts
        flatten: true, expand: true
    angular_mocks:
        flatten: true, expand: true
        src: paths.components + 'angular-mocks/angular-mocks.js'
        dest: paths.vendorScripts

coffeeTasks =
    app:
        expand: true
        cwd: paths.appScripts
        src: '**/*.coffee'
        dest: paths.temp + 'app'
        ext: '.js'
    common:
        expand: true
        cwd: paths.commonScripts
        src: '**/*.coffee'
        dest: paths.temp + 'common'
        ext: '.js'

sassTasks =
    app:
        files: [
            expand: true
            cwd: paths.appStylesheets
            src: '**/*.sass'
            dest: paths.temp + 'app'
            ext: '.css'
        ]
    common:
        files: [
            expand: true
            cwd: paths.commonStylesheets
            src: '**/*.sass'
            dest: paths.temp + 'common'
            ext: '.css'
        ]

uglifyTasks =
    options: mangle: true
    app: files: 'public/app/build/app.min.js': paths.temp + 'app/**/*.js'
    common:
        files: [
            expand: true
            cwd: paths.temp + 'common/'
            src: '**/*.js'
            dest: paths.commonBuild
            ext: '.min.js'
        ]

cssminTasks =
    app: files: 'public/app/build/app.min.css': [
        paths.temp + 'app/**/*.css'
        paths.appStylesheets + '**/*.css'
    ]
    common_temp:
        expand: true
        cwd: paths.temp + 'common/'
        src: '**/*.css'
        dest: paths.commonBuild
        ext: '.min.css'
    common_css:
        expand: true
        cwd: paths.commonStylesheets
        src: '**/*.css'
        dest: paths.commonBuild
        ext: '.min.css'

cleanTasks =
    vendor: src: paths.vendor
    temp: src: paths.temp
    build: src: [paths.appBuild, paths.commonBuild]

watchTasks =
    coffee_app:
        files: paths.appScripts + '**/*.coffee',
        tasks: ['coffee:app', 'uglify:app']
    coffee_common:
        files: paths.commonScripts + '**/*.coffee',
        tasks: ['coffee:common', 'uglify:common']
    css_app:
        files: paths.appStylesheets + '**/*.sass',
        tasks: ['sass:app', 'cssmin:app']
    css_common:
        files: paths.commonStylesheets + '**/*.sass',
        tasks: ['sass:common', 'cssmin:common']

module.exports = (grunt) ->
    grunt.initConfig
        copy: copyTasks
        coffee: coffeeTasks
        sass: sassTasks
        uglify: uglifyTasks
        cssmin: cssminTasks
        clean: cleanTasks
        watch: watchTasks

    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-sass'
    grunt.loadNpmTasks 'grunt-contrib-cssmin'
    grunt.loadNpmTasks 'grunt-contrib-copy'

    grunt.registerTask 'default', ['build', 'watch']
    grunt.registerTask 'build', ['clean:build', 'coffee', 'sass', 'uglify', 'cssmin', 'clean:temp']
    grunt.registerTask 'vendor', ['clean:vendor', 'copy']