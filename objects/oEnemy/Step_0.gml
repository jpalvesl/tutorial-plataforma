var onTheFloor = false

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
	horizontalSpeed = -horizontalSpeed
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
	sprite_index = sEnemyAirbourne
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
	image_speed = 1
	if (horizontalSpeed  == 0)
	{
		sprite_index = sEnemy
	}
	else {
		sprite_index = sEnemyRunning
		
		if (horizontalSpeed != 0) {
			image_xscale = sign(horizontalSpeed)
		}
	}
}

