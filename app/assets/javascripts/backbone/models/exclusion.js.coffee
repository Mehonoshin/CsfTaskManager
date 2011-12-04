class CsfTaskManager.Models.Exclusion extends Backbone.Model
  paramRoot: 'exclusion'
  url: ->
    u = '/goals/' + this.get("goal_id") + '/exclusions/'
    u = u + this.id if this.id
    u
  
class CsfTaskManager.Collections.ExclusionsCollection extends Backbone.Collection
  model: CsfTaskManager.Models.Exclusion
  url: '/exclusions'