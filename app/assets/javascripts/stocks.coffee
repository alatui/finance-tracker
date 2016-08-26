# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
init_stock_lookup = () ->
  $('#stock-lookup-form').on('ajax:before', (event, data, status) ->
    show_spinner()
    $('#stock-lookup-results').replaceWith('')
  )

  $('#stock-lookup-form').on('ajax:after', (event, data, status) ->
    hide_spinner()
  )

  $('#stock-lookup-form').on('ajax:success', (event, data, status) ->
    $('#stock-lookup').replaceWith(data)
    init_stock_lookup()
  )

  $('#stock-lookup-form').on('ajax:error', (event, xhr, status, error) ->
    hide_spinner()
    $('#stock-lookup-results').replaceWith('')
    $('#stock-lookup-errors').replaceWith('Stock was not found')
  )




$(document).on('turbolinks:load', ->
  init_stock_lookup()
)