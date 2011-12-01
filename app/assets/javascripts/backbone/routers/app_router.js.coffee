class CsfTaskManager.Routers.AppRouter extends Backbone.Router
  initialize: (options) ->
    this.goalsController = new CsfTaskManager.Views.goalsView()
    this.rolesController = new CsfTaskManager.Views.rolesView()

  routes:
    "": "root",
    "!/": "root",
    "!/goal/:id": "goal",
    "!/role/:id": "role"

  root: ->
    $('.app-screen').hide()
    $('#calendar-grid').show()
    $('.alert-message').hide()

  goal: (id) ->
    $('.app-screen').hide()
    $('#goal-form').show()
    if id then this.goalsController.renderEditForm(id) else this.goalsController.renderAddForm()
    $('.alert-message').hide()

  role: (id) ->
    $('.app-screen').hide()
    $('#role-form').show()
    $('.alert-message').hide()