'use strict'

describe 'MainCtrl', ->

    controller = undefined

    beforeEach ->
        module 'Application'
        inject ($rootScope, $controller) ->
            scope = $rootScope.$new()
            controller = $controller 'MainCtrl', '$scope': scope

    it 'should be defined', ->
        expect(controller).toBeDefined()