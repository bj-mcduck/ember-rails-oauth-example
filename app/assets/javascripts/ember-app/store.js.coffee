# http://emberjs.com/guides/models/using-the-store/

App.Store = DS.Store.extend()

DS.RESTAdapter.reopen
  namespace: 'api'
