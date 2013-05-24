updateGps = ->
  console.log 'meemoo'
  if compass.err
    $('#sendName').val(compass.err)
  else
    $('#lat').val(compass.lat)
    $('#lng').val(compass.lng)
$ ->
  setInterval( (-> updateGps()), 1000)