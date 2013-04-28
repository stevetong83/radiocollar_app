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
    @stage.empty()
    @stage.html($(firstScene).html())

  goBack: ->
    back          = @sceneHistory.length - 1
    previousScene = @sceneHistory[back] 
    @scene        = $(previousScene)
    @_render previousScene
    @sceneHistory.pop()

  perform: (scene) ->
    @sceneHistory = @sceneHistory.concat(@scene.selector) if @scene
    @scene = $(scene)
    @_render scene

  _render: (scene) ->
    @stage.fadeOut 200, =>
      @stage.hide()
      @stage.html($(scene).html()).fadeIn(200)

  #TODO: Add support for:
    #state saving
    #underscore templates

$ ->
  window.nav = new Theatre {stage: '#content',firstScene: '#scene1'}