#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.CsfTaskManager =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  init: ->
    rt = new CsfTaskManager.Routers.AppRouter()
    Backbone.history.start()