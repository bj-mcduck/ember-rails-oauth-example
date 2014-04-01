App.UsersRoute = Ember.Route.extend
  model: ->
    @store.find 'user'

App.UserRoute = Ember.Route.extend
  setUpController: (controller, user)->
    controller.set('model', user)