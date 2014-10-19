"use strict"
User = require "../common/models/user"


module.exports = (server) ->

  server.post "/api/signup", (request, response) ->
    if request.required ['mail', 'password']
      User.signup(request.parameters).then (error, result) ->
        _session response, error, result


  server.post "/api/login", (request, response) ->
    if request.required ['mail', 'password']
      User.login(request.parameters).then (error, result) ->
        _session response, error, result

# -- Private Methods -----------------------------------------------------------
_session = (response, error, result) ->
  if error
    response.json message: error.message, error.code
  else
    response.json result.parse()
