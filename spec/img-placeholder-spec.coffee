# {WorkspaceView} = require 'atom'
# ImgPlaceholder = require '../lib/img-placeholder'
#
# # Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
# #
# # To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# # or `fdescribe`). Remove the `f` to unfocus the block.
#
# describe "ImgPlaceholder", ->
#   activationPromise = null
#
#   beforeEach ->
#     atom.workspaceView = new WorkspaceView
#     activationPromise = atom.packages.activatePackage('img-placeholder')
#
#   describe "when the img-placeholder:toggle event is triggered", ->
#     it "attaches and then detaches the view", ->
#       expect(atom.workspaceView.find('.img-placeholder')).not.toExist()
#
#       # This is an activation event, triggering it will cause the package to be
#       # activated.
#       atom.workspaceView.trigger 'img-placeholder:toggle'
#
#       waitsForPromise ->
#         activationPromise
#
#       runs ->
#         expect(atom.workspaceView.find('.img-placeholder')).toExist()
#         atom.workspaceView.trigger 'img-placeholder:toggle'
#         expect(atom.workspaceView.find('.img-placeholder')).not.toExist()
