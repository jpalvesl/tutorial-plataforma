/// @description Control menu

menuX += (menuXTarget - menuX) / menuSpeed

// Keyboard controls
if (menuControl)
{
	if (keyboard_check_pressed(vk_up))
	{
		menuCursor++
		menuCursor %= menuItems
	}
	if (keyboard_check_pressed(vk_down))
	{
		menuCursor--
		if (menuCursor < 0) menuCursor = menuItems-1

	}
	
	if (keyboard_check_pressed(vk_enter))
	{
		menuXTarget = guiWidth + 200
		menuCommited = menuCursor
		ScreenShake(4,30)
		menuControl = false
	}
}

if (menuX > guiWidth+150) and (menuCommited != -1)
{
	switch (menuCommited)
	{
		case 2:
		{
			SlideTransitions(TRANSITION_MODE.NEXT)
			break
		}
		case 1:
		{
			if (!file_exists(SAVEFILE)) {
				SlideTransitions(TRANSITION_MODE.NEXT)
			}
			else {
				var file = file_text_open_read(SAVEFILE)
				var target = file_text_read_real(file)
				file_text_close(file)
				SlideTransitions(TRANSITION_MODE.GOTO, target)
			}
			break
		}
		case 0:
		{
			game_end()
			break
		}
	}
}