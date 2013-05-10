class Compass
  constructor: (options = {enableHighAccuracy: yes, maximumAge: 10000, timeout: 100000}) ->
    @lat    = 0
    @lng    = 0
    @alt    = 0
    @acc    = 0
    @altAcc = 0
    @hdg    = 0
    @spd    = 0
    @_grabGPS(options)
  #OPTIMIZE: Put all the underscore methods into a closure.
  _grabGPS: (options) ->
    navigator.geolocation.watchPosition(@_parseGPS, @_parseErr, options)
  _parseGPS: (position) =>
    @lat    =position.coords.latitude
    @lng    =position.coords.longitude
    @alt    =position.coords.altitude
    @acc    =position.coords.accuracy
    @altAcc =position.coords.altitudeAccuracy
    @hdg    =position.coords.heading
    @spd    =position.coords.speed
  _parseErr: (err) ->
    switch err.code
      when 1
        @error = 'Permission denied by user'
      when 2
        @error = 'Cant fix GPS position'
      when 3
        @error = 'GPS is taking too long to respond'
      else
        @error = 'Well, this is embarassing...'
    console.log @error
  stop: ->
    navigator.geolocation.clearWatch()
      
    

window.compass = new Compass()

# $ ->
#   $("#receive").click ->
#     waypoint_url = undefined
#     waypoint_url = "p/" + ($("#waypoint_name").val())
#     document.location.href = waypoint_url

#   showLocation = (position) ->
#     latitude = undefined
#     longitude = undefined
#     latitude = position.coords.coords.latitude
#     longitude = position.coords.coords.longitude
#     $("#lat").val latitude
#     $("#lng").val longitude
#     $(".status").html "Ready to send"

#   errorHandler = (err) ->
#     if err.code is 1
#       $(".status").html "Access to GPS denied"
#     else
#       $(".status").html "Can't find location."  if err.code is 2

#   getLocation = ->
#     options = undefined
#     if navigator.geolocation
#       options = timeout: 10000
#       navigator.geolocation.getCurrentPosition showLocation, errorHandler, options
#     else
#       $(".status").html "App requires GPS connectivity. Try another device."

#   getLocation()
#   $("#send").click ->
#     getLocation()
#     $.ajax
#       type: "POST"
#       url: "/"
#       data: $("form.send").serialize()
#       dataType: "json"

#     conf_url = undefined
#     conf_url = "p/" + ($("#sendName").val())
#     alert "Your location has been sent. We will now redirect you to the map to verify accuracy. Your shareable URL for this waypoint is: http://radiocollar.heroku.com/" + conf_url
#     document.location.href = conf_url