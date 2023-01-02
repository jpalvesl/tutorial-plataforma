var onTheFloor = false

if (done == 0) {
	verticalSpeed += _gravity

	if (place_meeting(x, y+1, oWall))
	{
		onTheFloor = true
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
		if (verticalSpeed > 0) {
			done = 1
			image_index = 1	
		}
		
		while (!place_meeting(x, y + sign(verticalSpeed), oWall))
		{
			y += sign(verticalSpeed)
		}
		verticalSpeed = 0
	}
	y += verticalSpeed
}