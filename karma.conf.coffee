'use strict'

module.exports = (config) ->
    config.set
        basePath: ''
        frameworks: ['jasmine']
        plugins: ['karma-jasmine', 'karma-chrome-launcher', 'karma-coffee-preprocessor']

        files: [
            'public/vendor/scripts/jquery.min.js'
            'public/vendor/scripts/angular.min.js'
            'public/vendor/scripts/angular-mocks.js'
            'public/vendor/scripts/angular-sanitize.min.js'
            'public/vendor/scripts/angular-ui-router.min.js'

            'public/app/build/*.js'
            'public/unit/**/*.coffee'
        ]
        exclude: []
        preprocessors:
            '**/*.coffee': 'coffee'

        reporters: ['progress']
        port: 9876
        colors: true
        logLevel: config.LOG_INFO
        autoWatch: true
        browsers: ['Chrome']
        singleRun: true