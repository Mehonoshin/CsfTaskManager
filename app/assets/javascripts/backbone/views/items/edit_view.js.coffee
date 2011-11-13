CsfTaskManager.Views.Items ||= {}

class CsfTaskManager.Views.Items.EditView extends Backbone.View
  template : JST["backbone/templates/items/edit"]
  
  events :
    "submit #edit-item" : "update"
    
  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
    
    @model.save(null,
      success : (item) =>
        @model = item
        window.location.hash = "/#{@model.id}"
    )
    
  render : ->
    $(this.el).html(this.template(@model.toJSON() ))
    
    this.$("form").backboneLink(@model)
    
    return this