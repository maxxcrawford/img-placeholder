ImgPlaceholderView = require './img-placeholder-view'

# module.exports =
#   imgPlaceholderView: null
#
#   activate: (state) ->
#     @imgPlaceholderView = new ImgPlaceholderView(state.imgPlaceholderViewState)
#
#   deactivate: ->
#     @imgPlaceholderView.destroy()
#
#   serialize: ->
#     imgPlaceholderViewState: @imgPlaceholderView.serialize()

module.exports =
  activate: ->
    atom.workspaceView.command 'img-placeholder:insert', => @convert()

  convert: ->
    # This assumes the active pane item is an editor
    editor = atom.workspace.activePaneItem

    # Generate random hex color
    letters = '0123456789abcdef'.split ''
    randomColor = (letters[Math.floor(Math.random() * 16)] for i in [0..6]).join ''

    editor.insertText "<img src='//placehold.it/600x400/" + randomColor + ".png'/>"
