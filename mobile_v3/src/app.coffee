#=======================#
# This is a re-adaption
# of 'unpopular ideas'.
# It's only half done.
# I Left off on views
# (Line 62)
#=======================#


$ ->
#===
  class window.Place extends Backbone.Model
    idAttribute: "_id"
    # defaults: ->
    #   #Not too useful for this model
    #   title: ""
    initialize: ->
      @set title: @get("title")
    validate: (attrs, optns) ->
      if !@title
        "Title is required"
      else if !@lat
        "Latitude is required"
      else if !@lng
        "Longitude is required"
      #Returning undefined == good
    urlRoot: "/places"

#===
  class window.Places extends Backbone.Collection
    model: Place
    url: "/places"

  class window.PlaceView extends Backbone.View
    tagtitle: "form"
    initialize: ->
      _.bindAll this, "render", "remove"
      @model.bind "change", @render
      @model.bind "destroy", @remove
      @template = _.template($("#gpsCtrlTmpl").html())

    events:
      "click #send": "updatePlace"

    clear: ->
      #Probably should implement this at some point...
      @model.destroy()

    edit: ->
      #See comment for @clear()
      oldTitle = @model.get("title")

    updatePlace: (e) ->
      @model.save()

    render: ->
      renderedContent = @template(@model.toJSON())
      $(@el).html renderedContent
      #@ for method chaining
      @

#===
  class window.PlacesView extends Backbone.View
    initialize: ->
      _.bindAll this, "render"
      @template = _.template($("#places-template").html())
      @collection.bind "reset", @render
      @collection.bind "change", @render

    render: ->
      $places = undefined
      collection = undefined
      $(@el).html @template
      
      #using this.$() scopes it to the particular DOM element
      $places = @$(".places")
      @collection.each (place) ->
        placeItem = new PlaceView(
          model: place
          collection: collection
        )
        $places.append placeItem.render().el

      this

    events:
      "keypress .inputBox": "newPlace"

    newPlace: (e) ->
      if e.keyCode is 13
        if ($(".inputBox").val().length < 50) and ($(".inputBox").val().length > 2)
          newPlace = new Place()
          newPlace.set "title", $(".inputBox").val()
          newPlace.save()
          $(".inputBox").val ""
          @collection.fetch()
        
        #wtf. Why wont it automatically repopulate?
        else
          alert "Places must be between 3 and 49 characters in length. Try again."

#===
  class window.UnpopularPlaces extends Backbone.Router
    routes:
      "": "home"

    initialize: ->
      places = new Places()
      places.fetch()
      @stream = new PlacesView(collection: places)

    home: ->
      $("#container").append @stream.render().el

  window.App = new UnpopularPlaces()
  Backbone.history.start()
