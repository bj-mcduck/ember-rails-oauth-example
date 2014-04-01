App.ApplicationController = Ember.Controller.extend
  signedInUser: (->
    @store.find 'user', localStorage['currentUser']
  ).property('App.currentUser')

  userSignedIn: (->
    localStorage['currentUser']?
  ).property('App.currentUser')

  actions:
    signOut: ->
      console.log "Sign Out"
      delete localStorage['currentUser']
      App.set 'currentUser', `undefined`