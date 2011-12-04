class CsfTaskManager.Models.Goal extends Backbone.Model
  paramRoot: 'goal'

  initialize: ->
    this.exclusions = new CsfTaskManager.Collections.ExclusionsCollection(this.get("exclusions"))

  url: ->
    u = '/goals/'
    u = u + this.id if this.id
    u

  excluded: (date) ->
    i = 0
    for ex in this.exclusions.models
      i += 1 if eqlDate(date, new Date(ex.get('date')))
    if i == 0
      false
    else
      true
  
class CsfTaskManager.Collections.GoalsCollection extends Backbone.Collection
  model: CsfTaskManager.Models.Goal
  url: '/goals'