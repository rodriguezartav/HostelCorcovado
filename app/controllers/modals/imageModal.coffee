Spine   = require('spine')
$       = Spine.$

class ImageModal extends Spine.Controller
  @extend Spine.Controller.Modal
  
  className: 'showWarning modal'

  @type = "image"

  events:
    "click .js_close" : "onClose"
    "click .next"     : "onNext"

  constructor: ->
    super
    @render()
    
  render: =>
    img = @data.element.find "img"
    caption = @data.element.find ".caption"
    console.log img
    @html require('views/modals/imageModal')(image: img.attr("src") , caption: caption.html() )

  onClose: =>
    Spine.trigger "hide_modal"

  onNext: =>
    lastElement = @data.element
    @data.element = @data.element.next();
    return @nextRow(lastElement) if @data.element.find("img").length ==0
    @render()

  nextRow: (element) =>
    index = @data.elements.index element
    @data.element = $(@data.elements[index+1])
    return @onClose() if @data.element.find("img").length ==0
    @render()
    
   
module.exports = ImageModal
