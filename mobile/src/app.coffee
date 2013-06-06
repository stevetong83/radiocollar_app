window.datasend = (url1, method1, data1) ->
  $.ajax(
    method: method1
    url: "http://192.168.0.4:3000/api/v1/#{url1}"
    type: 'jsonp'
    crossDomain: true
    data: data1
    context: document.body
  ).done ->
    console.log 'sent data'
# window.datasend = (url1, method1, data1) ->
#   $.ajax
#     type: "POST" # you request will be a post request
#     data: postData # javascript object with all my params
#     url: "http://192.168.0.4:3000/api/v1/#{url1}"
#     dataType: "jsonp" # datatype can be json or jsonp
#     success: (result) ->
#       console.dir result

$.support.cors = true;

$ ->
  datasend('login', 'POST', {email: 'rick.carlino\@gmail.com', password: 'password1'})
# $ ->
#   FlyJSONP.init {debug: true}
#   window.hope = (url1, data1) ->
#     FlyJSONP.post
#       url: "http://192.168.0.4:3000/api/v1/#{url1}"
#       parameters: data1
#       success: (data) ->
#         console.log data
#       error: (errorMsg) ->
#         console.log errorMsg