
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
  return
