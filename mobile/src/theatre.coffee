#ISBAT Go back
#ISNBAT Go back if @lastStage == nil

class Theatre
  constructor: ((frontStage = $('#stage'), backStage = $('#back_stage'), scene = $('#main_scene')) ->
    @frontStage = frontStage
    @backStage  = backStage
    @lastScene  = null
    @scene      = scene
  goTo: (stage) ->
    #Is there anything in the stage?
      #if so, set @lastStage to 
      #fade out the stage if there's anything on it
    #fade in the new stage
  goBack: ->
    @goTo @lastStage