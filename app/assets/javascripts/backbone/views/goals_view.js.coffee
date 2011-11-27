class CsfTaskManager.Views.goalsView extends Backbone.View

  initialize: ->
    this.render()
    CsfTaskManager.goals.bind('all', this.render, this)

  el: '#app'

  events:
    "click .add-goal": "addGoal",
    "click .delete-goal": "deleteGoal",
    "click .edit-goal": "editGoal"

  render: ->
    $('.role_goals').empty()
    this.sidebarGoal goal for goal in CsfTaskManager.goals.models

  sidebarGoal: (goal) ->
    $('tr.role-' + goal.get("role_id") + ' > td:last').append('<div class="b-weekly-role-goals__goal"><a href="#!/goal/' + goal.id + '">' + goal.get('title') + "</a></div>")

  addGoal: ->
    role_id_val = $('#goal_role_id').val()
    goal_title = $('.goal-title').val()
    goal_note = $('.goal-note').val()
    goal_date = $('#goal_date_3i').val() + "." + $('#goal_date_2i').val() + "." + $('#goal_date_1i').val()
    goal_repeat = $('#goal_repeat').val()
    newGoal = new CsfTaskManager.Models.Goal({title: goal_title, note: goal_note, role_id: role_id_val, date: goal_date, repeat: goal_repeat})
    newGoal.save null,
      success: (model, response) ->
        CsfTaskManager.goals.add(model)
    this.showSuccess("Goal added!")
    this.clearForm()	
    
      
  edit: (id) ->
    goal = CsfTaskManager.goals.get(id)
    this.currentGoal = goal
    $('.goal-title').val(goal.get('title'))
    $('.goal-note').val(goal.get('note'))
    $('#goal_role_id').val(goal.get('id'))
    $('#delete_form form').attr("action", "/goals/" + goal.id)

  editGoal: ->
    this.currentGoal.save()

  clearForm: ->
    $('.goal-title').val('')
    $('.goal-note').val('')

  deleteGoal: -> 
    CsfTaskManager.goals.remove(this.currentGoal)
    this.showSuccess("Goal deleted!")
    this.clearForm()

  showSuccess: (text) ->
    $('.alert-message .title').html("Success!")
    $('.alert-message .body').html(text)
    $('.alert-message').alert()
    $('.alert-message.success').show()
    