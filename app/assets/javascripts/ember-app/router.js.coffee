# For more information see: http://emberjs.com/guides/routing/
App.Router.reopen
  location: 'history'
  
App.Router.map ->
  @resource 'users', path: '/users', ->
    @route 'edit', path: 'edit'
  @route 'user', path: '/users/:user_id'

  @route 'sign-in'
  @route 'oauth_callbacks', path: '/auth/:provider/callback'
  @route 'missing', path: '*:'


App.OauthCallbacksRoute = Ember.Route.extend
  redirect: ->
    @transitionTo 'application'

App.MissingRoute = Ember.Route.extend
  redirect: ->
    @transitionTo 'missing'