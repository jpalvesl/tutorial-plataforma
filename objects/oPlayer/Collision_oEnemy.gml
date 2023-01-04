/// @description die
with (oGun) instance_destroy();
instance_change(oPlayerDead, true)

direction = point_direction(other.x, other.y, x, y)
horizontalSpeed = lengthdir_x(6, direction)
verticalSpeed = lengthdir_y(4, direction)-2

if (sign(horizontalSpeed) != 0) image_xscale = sign(horizontalSpeed)

