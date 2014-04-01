App.SignInController = Ember.Controller.extend
  needs: [ 'application' ]

  actions:
    signIn: ->
      console.log "Sign In"

      email = @get("email")
      console.log email
      @store.find( 'user', { email: email } ).then (user)->
        console.log user
        console.log "'#{user}'"
        console.log user.email
        localStorage["currentUser"] = user.id
        App.set "currentUser", user.id
