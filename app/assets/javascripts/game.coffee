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

    content = $(content).on "click", -> 
        use_card(data.url)
        this.remove

    card_object = $("#card_container").append -> content


#Requests a new card from the server and adds the card to the game
request_card_from_server = (url) ->
    $.ajax url,
        type: 'GET'
        dataType: 'json'
        error: (jqXHR, text_status, errorThrown) ->
            $('body').append "AJAX Error: #{errorThrown}"
        success: (data, text_status, jqXHR) ->
            add_card(data)

update_info = (status) ->
    $("#player_health").text(status.player.health)

use_card = (url) ->
    $.ajax url,
        type: 'GET'
        dataType: 'json'
        error: (jqXHR, text_status, errorThrown) ->
            $('body').append "AJAX Error: #{errorThrown}"
        success: (data, text_status, jqXHR) ->
            update_info(data)

@combat_handler = (urls) ->
    request_card_from_server(urls.new_card_path)
    #request_card_from_server(urls.new_card_path)
    request_card_from_server(urls.new_card_path)

