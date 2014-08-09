'use strict'

describe 'MainCtrl', ->

    controller = undefined
    scope = undefined

    beforeEach ->
        module 'Application'
        inject ($rootScope, $controller) ->
            scope = $rootScope.$new()
            controller = $controller 'MainCtrl', '$scope': scope

    it 'should be defined', ->
        expect(controller).toBeDefined()

    it 'should have title', ->
        expect(scope.title).toBe 'Hello World!'