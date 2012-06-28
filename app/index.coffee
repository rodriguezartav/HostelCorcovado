require('lib/setup')

Spine = require('spine')

ImageModal = require("controllers/modals/imageModal")


class App extends Spine.Controller
  @extend Spine.Controller.ModalController
  
  elements:
    ".carouselImages" : "carouselImages"
    ".modable" : "modables"
  
  events:
    "click .modable"  : "onModableClick"

  constructor: ->
    super
    @setupModal()
    
    for modable in @modables
      modable = $(modable)
      img = modable.find("img").attr "src"
      caption = modable.find(".caption").html()
      @addCarouselItem( image: img , caption: caption)
    
    $('.carousel').carousel('next')
    
  onModableClick: (e) =>
    target  = $(e.target)
    modable = target.parents ".modable"
    element = if modable.length > 0 then modable else target
    elements = $('.modable')
    Spine.trigger "show_modal" , 'image' , element: element , elements: elements

  addCarouselItem: (src) =>
    @carouselImages.append require("views/carouselItem")(src)


module.exports = App
    