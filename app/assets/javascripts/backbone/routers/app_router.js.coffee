class CsfTaskManager.Routers.AppRouter extends Backbone.Router
  initialize: (options) ->
    goalsBlock = new CsfTaskManager.Views.goalsView()
    rolesForm = new CsfTaskManager.Views.rolesView()

  routes:
    "!/": "root",
    "!/form": "form",
    "!/role": "role"

  root: ->
    $('.app-screen').hide()
    $('#calendar-grid').show()
    $('.alert-message').hide()

  form: ->
    $('.app-screen').hide()
    $('#goal-form').show()
    $('.alert-message').hide()

  role: ->
    $('.app-screen').hide()
    $('#role-form').show()
    $('.alert-message').hide()