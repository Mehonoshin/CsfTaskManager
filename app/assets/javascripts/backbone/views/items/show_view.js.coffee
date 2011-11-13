CsfTaskManager.Views.Items ||= {}

class CsfTaskManager.Views.Items.ShowView extends Backbone.View
  template: JST["backbone/templates/items/show"]
   
  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    return this