# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

add_card = (name) ->
    content = "<div class='card'>"
    content += "<p>"
    content += name
    content += "</p>"
    content += "</div>"
    $("#card_container").append -> content

request_cards_from_server = () ->
    $.ajax 'new_card',
        type: 'GET'
        dataType: 'json'
        error: (jqXHR, text_status, errorThrown) ->
            $('body').append "AJAX Error: #{errorThrown}"
        success: (data, text_status, jqXHR) ->
            add_card(data)

@combat_handler = () ->
    add_card("A card")
    request_cards_from_server()

