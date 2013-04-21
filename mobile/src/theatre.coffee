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
  goBack: ->
    @perform @lastStage.pop() if @sceneHistory.length > 0
  perform: (scene, data = {}) ->
    @sceneHistory.concat(@scene) if @scene
    @scene = $(scene)
    @stage.empty()
    new_content = @render(scene, data)
    @stage.html($(new_content).html())
  render: (scene, data = {}) ->
    #This method returns a string formatted via underscore templates
    compiled = _.template($(scene).text())
    compiled(data)

$ ->
  window.radioCollar = new Theatre {stage: '#front_stage',firstScene: '#scene3'}
  $('#back').click ->
    radioCollar.goBack()
  $('#second').click ->
    radioCollar.perform('#scene2')
  $('#first').click ->
    radioCollar.perform('#scene1')