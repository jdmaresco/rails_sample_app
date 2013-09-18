# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

check_current_length = (textbox_to_check) ->
	value = $('#micropost_content').val().length
	update_chars_remaining(value)

update_chars_remaining = (value) ->
	$('#chars_remaining').html(140-value)

$ ->
	$('#micropost_content').keyup ->
		check_current_length($('#micropost_content'))