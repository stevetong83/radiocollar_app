class Theatre
  #Remember: Stages are passed as selector ID strings's, not JQuery selectors.
  constructor: ({stage, firstScene, backStage}) ->
    stage         ?= '#front_stage'
    firstScene    ?= false
    backStage     ?= '#back_stage'
    $(backStage).hide()
    @stage         = $(stage)
    @sceneHistory  = []
    @scene         = $(firstScene) if firstScene?
    @render firstScene if firstScene?

  goBack: ->
    back          = @sceneHistory.length - 1
    previousScene = @sceneHistory[back] 
    @scene        = $(previousScene)
    @render previousScene
    @sceneHistory.pop()

  perform: (scene) ->
    @sceneHistory = @sceneHistory.concat(@scene.selector) if @scene
    @scene = $(scene)
    @render scene

  render: (scene) ->
    @stage.empty()
    @stage.html($(scene).html())

$ ->
  radioCollar = new Theatre {firstScene: '#scene3'}
  $('#back').click ->
    radioCollar.goBack()
  $('#second').click ->
    radioCollar.perform('#scene2')
  $('#first').click ->
    radioCollar.perform('#scene1')