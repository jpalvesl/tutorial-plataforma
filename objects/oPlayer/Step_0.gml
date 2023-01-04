// Obtendo os Inputs do jogador

if (hasControl)
{
	key_left = keyboard_check(vk_left) or keyboard_check(ord("A"))
	key_right = keyboard_check(vk_right) or keyboard_check(ord("D"))
	key_jump = keyboard_check_pressed(vk_space) or keyboard_check(vk_up) or keyboard_check(ord("W")) 

	if (key_left or key_right or key_jump) controller = 0

	if (abs(gamepad_axis_value(0, gp_axislh)) > 0.2) {
		key_left = abs(min(gamepad_axis_value(0, gp_axislh), 0))
		key_right= max(gamepad_axis_value(0, gp_axislh), 0)

		controller = 1
	}

	if (gamepad_button_check_pressed(0, gp_face1))
	{
		key_jump = 1
		controller = 1
	}
}
else 
{
	key_right = 0
	key_left = 0
	key_jump = 0
}


// Calculando o movimento
var move = key_right - key_left
var onTheFloor = false;

horizontalSpeed = move * walkSpeed
verticalSpeed += _gravity

if (place_meeting(x, y+1, oWall))
{
	onTheFloor = true
}

if (onTheFloor and (key_jump))
{
	verticalSpeed = -7
}

// Colisao horizontal
if (place_meeting(x+horizontalSpeed, y, oWall))
{
	while (!place_meeting(x + sign(horizontalSpeed), y, oWall))
	{
		x += sign(horizontalSpeed)
	}
	horizontalSpeed = 0
}

x += horizontalSpeed


// Colisao vertical
if (place_meeting(x, y + verticalSpeed, oWall))
{
	while (!place_meeting(x, y + sign(verticalSpeed), oWall))
	{
		y += sign(verticalSpeed)
	}
	verticalSpeed = 0
}

y += verticalSpeed

// Animacoes
if (!onTheFloor)
{
	sprite_index = sPlayerAirbourne
	image_speed = 0
	if (sign(verticalSpeed >= 0))
	{
		image_index = 1
	}
	else 
	{
		image_index = 0
	}
} 
else {
	if (sprite_index == sPlayerAirbourne) 
	{	
		audio_sound_pitch(snLanding, choose(0.8, 1.0, 1.2))
		audio_play_sound(snLanding, 4, false)
	}
	image_speed = 1
	if (horizontalSpeed  == 0)
	{
		sprite_index = sPlayer
	}
	else {
		sprite_index = sPlayerRunning
		
		if (horizontalSpeed != 0) {
			image_xscale = sign(horizontalSpeed)
		}
	}
}

