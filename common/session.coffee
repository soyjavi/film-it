"use strict"
Hope = require("zenserver").Hope
User = require "./models/user"


module.exports = (request, response) ->
  promise = new Hope.Promise()
  session = request.session
  if not session
    response.unauthorized()
  else
    User.findOne _id: session, (error, result) ->
      if result
        promise.done error, result
      else
        response.unauthorized()
  promise
