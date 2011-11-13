class CsfTaskManager.Routers.AppRouter extends Backbone.Router
  initialize: (options) ->
    goalsBlock = new CsfTaskManager.Views.goalsView()

  routes:
    "!/": "root",
    "!/form": "form",
    "!/role": "role"

  root: ->
    $('.app-screen').hide()
    $('#calendar-grid').show()

  form: ->
    $('.app-screen').hide()
    $('#goal-form').show()

  role: ->
    $('.app-screen').hide()
    $('#role-form').show()