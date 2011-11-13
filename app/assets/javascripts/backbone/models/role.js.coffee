class CsfTaskManager.Models.Role extends Backbone.Model
  paramRoot: 'role'
  url: "/roles"
  
class CsfTaskManager.Collections.RolesCollection extends Backbone.Collection
  model: CsfTaskManager.Models.Role
  url: '/roles'