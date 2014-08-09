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
    ($stateProvider, $urlRouterProvider) ->
        $urlRouterProvider
        .otherwise '/'
        $stateProvider
        .state 'main',
            url: '/'
            templateUrl: 'app/views/main.html'
            controller: 'MainCtrl as main'
        return
]