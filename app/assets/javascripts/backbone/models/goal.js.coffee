class CsfTaskManager.Models.Goal extends Backbone.Model
  paramRoot: 'goal'
  url: ->
    u = '/goals/'
    u = u + this.id if this.id
    u
  
class CsfTaskManager.Collections.GoalsCollection extends Backbone.Collection
  model: CsfTaskManager.Models.Goal
  url: '/goals'