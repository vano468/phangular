'use strict'

angular.module 'Application'

.controller 'MainCtrl', ['$scope', '$rootScope', ($scope, $rootScope) ->
    $scope.title = 'Hello World!'
    return
]