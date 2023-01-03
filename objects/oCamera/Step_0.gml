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

x = clamp(x, halfViewWidth+buffer, room_width - halfViewWidth-buffer)
y = clamp(y, halfViewHeight+buffer, room_height - halfViewHeight-buffer)

// Screen shake
x += random_range(-shakeRemain, shakeRemain)
y += random_range(-shakeRemain, shakeRemain)
shakeRemain = max(0, shakeRemain-((1/shakeLength)*shakeMagnitude))

// Update camera view
camera_set_view_pos(cam, x-halfViewWidth, y-halfViewHeight)

if (layer_exists("Mountais")) 
{
	layer_x("Mountains", x/2)
}

if (layer_exists("Trees")) 
{
	layer_x("Trees", x/4)
}