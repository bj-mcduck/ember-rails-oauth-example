attr = DS.attr
App.Profile = DS.Model.extend(
  gender:       attr 'string'
  first_name:   attr 'string'
  last_name:    attr 'string'
  full_name:    attr 'string'
  image:        attr 'string'

  user:         DS.belongsTo 'user'

  serialize: ->
    @getProperties [ 'guid', 'gender', 'first_name', 'last_name', 'full_name', 'image' ]
)