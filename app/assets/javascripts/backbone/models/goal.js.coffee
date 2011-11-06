class CsfTaskManager.Models.Goal extends Backbone.Model
  paramRoot: 'goal'
  url: "/goals"
  
class CsfTaskManager.Collections.GoalsCollection extends Backbone.Collection
  model: CsfTaskManager.Models.Goal
  url: '/goals'