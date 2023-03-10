

if (oPlayer.controller == 0) 
{
	image_angle = point_direction(x, y, mouse_x, mouse_y)
}
else
{
	var controllerH = gamepad_axis_value(0, gp_axisrh)
	var controllerV = gamepad_axis_value(0, gp_axisrv)

	if (abs(controllerH) > 0.2) or (abs(controllerV) > 0.2)
	{
		controllerAngle = point_direction(0, 0, controllerH, controllerV)
	}
	image_angle = controllerAngle
}	

firingDelay -= 1
recoil = max(0, recoil-1)
if (mouse_check_button(mb_left) or gamepad_button_check(0, gp_shoulderr)) and (firingDelay < 0)
{
	recoil = 4
	firingDelay = 5
	ScreenShake(2,10)
	audio_sound_pitch(snShoot, choose(0.7, 1.0, 1.3))
	audio_play_sound(snShoot, 0, false)
	with (instance_create_layer(x, y, "Bullets", oBullet)) 
	{
		speed = 25
		direction = other.image_angle + random_range(-3,3)
		image_angle = direction
	}
}

x -= lengthdir_x(recoil, image_angle)
y -= lengthdir_y(recoil, image_angle)

if (image_angle > 90) and (image_angle < 270)
{
	image_yscale = -1
}
else image_yscale = 1