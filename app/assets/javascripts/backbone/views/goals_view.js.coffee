class CsfTaskManager.Views.goalsView extends Backbone.View

  initialize: ->
    this.startWeekDate = new Date($(".b-day-priorities table").data("start"))
    this.endWeekDate = new Date($(".b-day-priorities table").data("end"))
    this.exclusionsView = new CsfTaskManager.Views.exclusionsView()
    this.render()
    CsfTaskManager.goals.bind('all', this.render, this)

  el: '#app'

  events:
    "click .add-goal": "addGoal",
    "click .delete-goal": "deleteGoal",
    "click .edit-goal": "editGoal"

  ########### Rendering
  render: ->
    $('.role_goals').empty()
    this.sidebarGoal goal for goal in CsfTaskManager.goals.models

    $('.b-day-priorities table td').html("")
    this.renderDayPrior goal for goal in CsfTaskManager.goals.models

    $('.b-weekly-priorities').html("")
    this.renderWeekPrior goal for goal in CsfTaskManager.goals.models

  renderDayPrior: (goal) ->
    date = new Date(goal.get("date"))
    if (goal.get("priority") == "day")
      if (goal.get("repeat_schedule") == "none") && dateInRange(date, this.startWeekDate, this.endWeekDate)
        this.goalTemplate goal, '.b-day-priorities table td.wday-' + goal.get("weekday")

      if (goal.get("repeat_schedule") == "daily") && greaterOrEqualThan(this.endWeekDate, date)
        $('.b-day-priorities table td').each (num, value) =>
          tdDate = new Date($(value).data("date"))
          if tdDate > date && !goal.excluded(tdDate)
            this.goalTemplate goal, value	

      if (goal.get("repeat_schedule") == "weekly") && greaterOrEqualThan(this.endWeekDate, date)
        tdDate = new Date($('.b-day-priorities table td.wday-' + goal.get("weekday")).data("date"))
        unless goal.excluded(tdDate)
          this.goalTemplate goal, '.b-day-priorities table td.wday-' + goal.get("weekday")

      if (goal.get("repeat_schedule") == "monthly")
        nextDate = nextMonthlyDate(date)
        if dateInRange(date, this.startWeekDate, this.endWeekDate) || dateInRange(nextDate, this.startWeekDate, this.endWeekDate)
          $('.b-day-priorities table td').each (num, value) =>
            tdDate = new Date($(value).data("date"))
            if eqlDate(tdDate, nextDate)
              this.goalTemplate goal, value

  renderWeekPrior: (goal) ->
    date = new Date(goal.get("date"))
    if (goal.get("priority") == "week") && dateInRange(date, this.startWeekDate, this.endWeekDate)
      this.goalTemplate goal, ".b-weekly-priorities"

  goalTemplate: (goal, container) -> 
    $(container).append("<div class='b-weekly-role-goals__goal'><a href='#!/goal/" + goal.id + "'>" + goal.get("title") + "</a></div>")

  renderAddForm: ->
    $('.delete-goal').hide()
    $('#new_goal input').val("")
    $('.goal-form h3.new').show()
    $('.goal-form h3.edit').hide()
    $('.edit-goal').hide()
    $('.add-goal').show()
    $('.exclusion-form').hide()

  renderEditForm: (id) ->
    goal = CsfTaskManager.goals.get(id)
    this.currentGoal = goal
    this.exclusionsView.reRenderFor(goal)
    $('.exclusion-form').show()
    $('.delete-goal').show()
    $('.goal-form h3.new').hide()
    $('.goal-form h3.edit').show()
    $('.edit-goal').show()
    $('.add-goal').hide()
    $('.goal-title').val(goal.get('title'))
    $('.goal-note').val(goal.get('note'))
    $('#goal_role_id').val(goal.get('id'))
    $('#goal_priority').val(goal.get('priority'))
    $('#delete_form form').attr("action", "/goals/" + goal.id)

  sidebarGoal: (goal) ->
    $('tr.role-' + goal.get("role_id") + ' > td:last').append('<div class="b-weekly-role-goals__goal"><a href="#!/goal/' + goal.id + '">' + goal.get('title') + "</a></div>")


  ########### CRUD
  setGoalData: (model) ->
    role_id_val = $('#goal_role_id').val()
    goal_title = $('.goal-title').val()
    goal_note = $('.goal-note').val()
    goal_date = $('#goal_date_3i').val() + "." + $('#goal_date_2i').val() + "." + $('#goal_date_1i').val()
    goal_repeat = $('#goal_repeat_schedule').val()
    goal_priority = $('#goal_priority').val()
    model.set({title: goal_title, note: goal_note, role_id: role_id_val, date: goal_date, repeat_schedule: goal_repeat, priority: goal_priority})

  addGoal: ->
    newGoal = new CsfTaskManager.Models.Goal()
    this.setGoalData(newGoal)
    newGoal.save null,
      success: (model, response) ->
        CsfTaskManager.goals.add(model)
    this.showSuccess("Goal added!")
    this.clearForm()	
    
  editGoal: ->
    this.setGoalData(this.currentGoal)
    this.currentGoal.save()
    this.showSuccess("Goal updated!")

  deleteGoal: -> 
    if confirm("Are you sure?")
      CsfTaskManager.goals.remove(this.currentGoal)
      this.currentGoal.destroy()
      this.showSuccess("Goal deleted!")
      this.clearForm()


  ########### Helpers
  showSuccess: (text) ->
    $('.alert-message .title').html("Success!")
    $('.alert-message .body').html(text)
    $('.alert-message').alert()
    $('.alert-message.success').show()
    
  clearForm: ->
    $('.goal-title').val('')
    $('.goal-note').val('')
