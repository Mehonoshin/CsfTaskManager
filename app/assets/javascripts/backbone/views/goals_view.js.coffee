class CsfTaskManager.Views.goalsView extends Backbone.View
  initialize: ->
    this.goals = new CsfTaskManager.Collections.GoalsCollection()

  el: $('#app'),
  events:
    "click .add-btn": "addGoal",
    "click #load": "loadGoals"

  render: ->
    this.loadGoals()

  addGoal: ->
    alert('ji')
    # newTitle = $('.goal-title').val()
    # newNote = $('.goal-note').val()
    # newGoal = new Goal({title: newTitle, note: newNote})
    # newGoal.save()
    # this.goals.add(newGoal)

  appendGoal: (goal) ->
    $("#goals-list").append("<li>" + goal.get('title') + "(" + goal.get('note') + ")</li>")

  loadGoals: ->
    this.goals.fetch()
    $("#goals-list").html('')
    appendGoal goal for goal in this.goals
      
