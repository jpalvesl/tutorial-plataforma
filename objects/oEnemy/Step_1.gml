if (hp <= 0) 
{
	with(instance_create_layer(x, y, layer, oDead))
	{
		direction = other.hitfrom
		horizontalSpeed = lengthdir_x(3, direction)
		verticalSpeed = lengthdir_y(3, direction) -2
		if (sign(horizontalSpeed)) 
		{
			image_xscale = sign(horizontalSpeed)
		}
	}
	
	instance_destroy()	
}