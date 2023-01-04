/// @description progress text

letters += _speed
textCurrent = string_copy(text, 1, floor(letters))

draw_set_font(fSign)
if (heigth == 0) heigth = string_height(text)
width = string_width(textCurrent)

// Destroy when done
if (letters >= length) and (keyboard_check_pressed(vk_anykey)) {
	instance_destroy()
	with (oCamera) follow = oPlayer
}
