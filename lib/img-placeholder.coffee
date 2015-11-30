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

    r = parseInt(randomColor.substr(0, 2), 16)
    g = parseInt(randomColor.substr(2, 2), 16)
    b = parseInt(randomColor.substr(4, 2), 16)

    yiq = ((r * 299) + (g * 587) + (b * 114)) / 1000

    if yiq >= 128 then contrast = "000000" else contrast = "FFFFFF"

    colorContrast = randomColor.toUpperCase() + "/" + contrast
    imgSrcText = "<img src='//placehold.it/600x400/" + colorContrast + "'/>"

    editor.insertText(imgSrcText)
