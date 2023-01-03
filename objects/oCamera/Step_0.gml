/// @description Update camera

// Update destination
if (instance_exists(follow)) 
{
	xTo = follow.x
	yTo = follow.y
}

// Update object position
x += (xTo - x) / 25
y += (yTo - y) / 25

x = clamp(x, halfViewWidth, room_width - halfViewWidth)
y = clamp(y, halfViewHeight, room_height - halfViewHeight)

// Update camera view
camera_set_view_pos(cam, x-halfViewWidth, y-halfViewHeight)