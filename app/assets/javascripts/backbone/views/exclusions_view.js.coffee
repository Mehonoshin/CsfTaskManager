class CsfTaskManager.Views.exclusionsView extends Backbone.View
  initialize: ->
    this.render()  

  el: '#app',
  events:
    "click .add-exclusion": "addExclusion",
    "click .delete-exclusion": "deleteExclusion",

  render: ->
    if this.goal != undefined
      $('table.exclusions-list').html("")
      this.renderExclusion exclusion for exclusion in this.goal.exclusions.models
	
  reRenderFor: (goal) ->
    this.goal = goal
    this.render()

  renderExclusion: (exclusion) ->
    date = new Date(exclusion.get("date"))
    $('table.exclusions-list').append("<tr class='exclusion ex-" + exclusion.id + "'><td>Excluded at " + date.format("d.m.Y") + "</td><td><button class='delete-exclusion btn danger' data-id='" + exclusion.id + "'>Delete</button></td></tr>")
	
  renderExclusions: ->

  addExclusion: ->
    exclusion_date = $('#exclusion_date_3i').val() + "." + $('#exclusion_date_2i').val() + "." + $('#exclusion_date_1i').val()
    newExclusion = new CsfTaskManager.Models.Exclusion({goal_id: this.goal.id, date: exclusion_date})
    newExclusion.save null,
      success: (model, response) ->
        CsfTaskManager.goals.get(model.get("goal_id")).exclusions.add(model)
    this.showSuccess("Exclusion added!")
    this.render()

  deleteExclusion: (e) ->
    id = $(e.currentTarget).data("id")
    $('.ex-' + id).remove()
    this.goal.exclusions.get(id).destroy()
    this.showSuccess("Exclusion removed!")

  ########### Helpers
  showSuccess: (text) ->
    $('.alert-message .title').html("Success!")
    $('.alert-message .body').html(text)
    $('.alert-message').alert()
    $('.alert-message.success').show()
