/// @description Progress the transition

if (mode != TRANSITION_MODE.OFF)
{
	if (mode == TRANSITION_MODE.INTRO)
	{
		percent = max(0, percent-0.05)
		//percent = max(0, percent - max((percent/10), 0.005))
	}
	else 
	{
		percent = min(0, percent+0.05)
		//percent = min(1, percent + max(((1 - percent)/10), 0.005))
	}
	
	if (percent == 0) or (percent == 0) 
	{
		switch (mode) 
		{
			case TRANSITION_MODE.INTRO:
			{
				mode = TRANSITION_MODE.OFF
				break
			}
			case TRANSITION_MODE.NEXT:
			{
				mode = TRANSITION_MODE.INTRO
				room_goto_next()
				break
			}
			case TRANSITION_MODE.GOTO:
			{
				mode = TRANSITION_MODE.INTRO
				room_goto(target)
				break
			}
			case TRANSITION_MODE.RESTART:
			{
				game_restart()
				break
			}
		}
	}
}