require('lib/setup')

Spine = require('spine')

ImageModal = require("controllers/modals/imageModal")


class App extends Spine.Controller
  @extend Spine.Controller.ModalController
  
  events:
    "click .modable"  : "onModableClick"

  constructor: ->
    super
    @setupModal()
    
    
  onModableClick: (e) =>
    target  = $(e.target)
    modable = target.parents ".modable"
    element = if modable.length > 0 then modable else target
    elements = $('.modable')
    Spine.trigger "show_modal" , 'image' , element: element , elements: elements


module.exports = App
    