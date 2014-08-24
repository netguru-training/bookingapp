

#= require jquery
#= require jquery_ujs
#= require select2
#= require bootstrap-sprockets
#= require pikaday
#= require moment
#= require_tree .
$("document").ready ->
  tomorrow = moment().fromNow();
  days = moment()

  new Pikaday(
    field: $("#booking_date_from")[0],
    minDate: tomorrow
  )

  new Pikaday(
    field: $("#booking_date_to")[0],
    minDate: days)

  new Pikaday(
    field: $("#place_available_from")[0],
    minDate: moment().add('days', 1),
    defaultDate: moment().add('days', 1),
    format: 'DD MM YYYY'
    )

  new Pikaday(
    field: $("#place_available_to")[0],
    minDate: moment().add('days', 1),
    defaultDate: moment().add('days', 1),
    format: 'DD MM YYYY'
    )

  $(".autocompleter").select2({
    loadMorePadding: 90,
    minimumInputLength: 1,
    maximumSelectionSize: 2,
  })

  $(".autocompleter").on "change", (e) ->
    $(".query").submit()
  return