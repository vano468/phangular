'use strict'

angular.module 'Application', ['ui.router']

.run [
    '$rootScope'
    '$state'
    '$stateParams'
    ($rootScope, $state, $stateParams) ->
        $rootScope.$state = $state
        $rootScope.$stateParams = $stateParams
        return
]

.config [
    '$stateProvider'
    '$urlRouterProvider'
    '$interpolateProvider'
    'Config'
    ($stateProvider, $urlRouterProvider, $interpolateProvider, Config) ->

        $interpolateProvider.startSymbol '[['
        $interpolateProvider.endSymbol ']]'

        $urlRouterProvider
        .otherwise '/'
        $stateProvider
        .state 'main',
            url: '/'
            templateUrl: Config.baseUri + 'app/views/main.html'
            controller: 'MainCtrl as main'
        return
]