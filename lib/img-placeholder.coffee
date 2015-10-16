ImgPlaceholderView = require './img-placeholder-view'
{CompositeDisposable} = require 'atom'

module.exports =
  subscriptions: null

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace',
      'img-placeholder:insert': => @insert()

  deactivate: ->
    @subscriptions.dispose()

  insert: ->
    editor = atom.workspace.getActiveTextEditor()

    # Generate random hex color
    letters = '0123456789abcdef'.split ''
    randomColor = (letters[Math.floor(Math.random() * 16)] for i in [0..5]).join ''
    placholderText = "<img src='//placehold.it/600x400/" + randomColor + ".png'/>"
    editor.insertText(placholderText)
