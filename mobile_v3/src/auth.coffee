$.support.cors = true;

$ ->
window.sendd = (url, meth, data1) ->
  $.ajax
    type: meth
    url: "http://localhost:3000/api/v1/#{url}"
    crossDomain: true
    data: data1
    dataType: "json"
    success: (data) ->
      alert data
    error: (responseData, textStatus, errorThrown) ->
     alert 'newp!'
     debugger





  # $("#go").click (e) ->
  #   $.ajax
  #     type: "GET"
  #     url: "http://localhost:3000/api/v1/sessions"
  #     crossDomain: true
  #     type: 'jsonp'
  #     context: document.body
  #     data:
  #       email: $("#email").val()
  #       password: $("#password").val()
  #       _method: 'POST'

  #     success: (data) ->
  #       console.log data
