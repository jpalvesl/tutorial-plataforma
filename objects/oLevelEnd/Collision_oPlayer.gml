/// @description Move to next room

with (oPlayer)
{
	if (hasControl)
	{
		hasControl = false
		SlideTransitions(TRANSITION_MODE.GOTO, other.target)
	}
}
