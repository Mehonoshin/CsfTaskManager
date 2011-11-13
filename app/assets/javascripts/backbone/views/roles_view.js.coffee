class CsfTaskManager.Views.rolesView extends Backbone.View
  initialize: ->
    this.roles = new CsfTaskManager.Collections.RolesCollection()

  el: $('#app'),
  events:
    "click .add-role-btn": "addRole"

  render: ->
    this.loadGoals()

  addGoal: ->
    newTitle = $('.role-title').val()
    newNote = $('.role-note').val()
    newRole = new Role({title: newTitle, note: newNote})
    newRole.save()
    this.roles.add(newRole)