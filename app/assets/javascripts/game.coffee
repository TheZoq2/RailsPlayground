# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#Creates a new card and appends it to the card container
add_card = (data) ->
    content = "<div class='card'>"
    content += "<p>"
    content += data.name
    content += "</p>"
    content += "<p>"
    content += data.description
    content += "</p>"
    content += "</div>"
    card_object = $("#card_container").append -> content

    card_object.on "click", -> use_card(data.id)

#Requests a new card from the server and adds the card to the game
request_card_from_server = () ->
    $.ajax 'combat/new_card',
        type: 'GET'
        dataType: 'json'
        error: (jqXHR, text_status, errorThrown) ->
            $('body').append "AJAX Error: #{errorThrown}"
        success: (data, text_status, jqXHR) ->
            add_card(data)

use_card = (id) ->
    $.ajax 'combat/use_card/' + id
        type: 'POST'
        dataType: 'json'
        error: (jqXHR, text_status, errorThrown) ->
            $('body').append "AJAX Error: #{errorThrown}"
        success: (data, text_status, jqXHR) ->
            alert("reply")

@combat_handler = () ->
    request_card_from_server()
    request_card_from_server()

