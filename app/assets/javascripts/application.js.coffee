
#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require pikaday
#= require_tree .
$("document").ready ->
  picker = new Pikaday(field: $("#booking_date_from")[0])
  picker = new Pikaday(field: $("#booking_date_to")[0])
  picker = new Pikaday(field: $('#place_available_from')[0])
  picker = new Pikaday(field: $('#place_available_to')[0])
  tomorrow = new Date()
  tomorrow.setDate tomorrow.getDate() + 1

  days = new Date()
  days.setDate days.getDate() + 2

  new Pikaday(
    field: $("#booking_date_from")[0],
    minDate: tomorrow
  )

  new Pikaday(
    field: $("#booking_date_to")[0],
    minDate: days)
  return
