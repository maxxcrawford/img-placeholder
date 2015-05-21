{View} = require 'atom'

module.exports =
class ImgPlaceholderView extends View
  @content: ->
    @div class: 'img-placeholder overlay from-top', =>
      @div "The ImgPlaceholder package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "img-placeholder:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "ImgPlaceholderView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
