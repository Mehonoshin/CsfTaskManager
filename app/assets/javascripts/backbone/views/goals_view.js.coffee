class CsfTaskManager.Views.goalsView extends Backbone.View

  initialize: ->
    this.goals = new CsfTaskManager.Collections.GoalsCollection()

  el: '#app'

  events:
    "click .add-goal": "addGoal",
    "click #load": "loadGoals"

  render: ->
    this.loadGoals()

  addGoal: ->
    newGoal = new CsfTaskManager.Models.Goal({title: $('.goal-title').val(), note: $('.goal-note').val(), role_id: $('#goal_role_id').val()})
    newGoal.save()
    this.goals.add(newGoal)
    $('.alert-message .title').html("Succes!")
    $('.alert-message .body').html("Goal added!")
    $('.alert-message').alert()
    $('.alert-message.success').show()
    $('.goal-title').val('')
    $('.goal-note').val('')
    

  appendGoal: (goal) ->
    $("#goals-list").append("<li>" + goal.get('title') + "(" + goal.get('note') + ")</li>")

  loadGoals: ->
    this.goals.fetch()
    $("#goals-list").html('')
    this.appendGoal goal for goal in this.goals.models
      
