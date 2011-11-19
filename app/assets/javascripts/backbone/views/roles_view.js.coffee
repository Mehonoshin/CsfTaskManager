class CsfTaskManager.Views.rolesView extends Backbone.View
  initialize: ->
    this.roles = new CsfTaskManager.Collections.RolesCollection()

  el: '#app',
  events:
    "click .add-role": "addRole"

  render: ->
    this.loadGoals()

  addRole: ->
    newRole = new CsfTaskManager.Models.Role({name: $('.role-title').val(), description: $('.role-note').val()})
    newRole.save()
    this.roles.add(newRole)
    $('.alert-message .title').html("Succes!")
    $('.alert-message .body').html("Role added!")
    $('.alert-message').alert()
    $('.alert-message.success').show()
    $('.role-title').val('')
    $('.role-note').val('')
    console.log(roles.at(role.length))
    $('#goal_role_id').append("<option value=" + newRole.get("id") + ">" + newRole.get("name") + "</option>")
