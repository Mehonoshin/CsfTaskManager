class CsfTaskManager.Models.Item extends Backbone.Model
  paramRoot: 'item'

  defaults:
  
class CsfTaskManager.Collections.ItemsCollection extends Backbone.Collection
  model: CsfTaskManager.Models.Item
  url: '/items'