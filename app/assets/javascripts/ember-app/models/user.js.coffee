attr = DS.attr
App.User = DS.Model.extend
  email:         attr 'string'
  screen_name:   attr 'string'

  profile:          DS.belongsTo 'profile'

  serialize: ->
    @getProperties [ 'guid', 'id', 'email', 'screen_name' ]
#  dream_symbols:    DS.hasMany 'dream_symbol'
#  interpretations:  DS.hasMany 'interpretation'
