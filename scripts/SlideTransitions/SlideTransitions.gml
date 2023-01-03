/// @desc SlideTransition(mode, targetRoom)
/// @arg mode sets transition mode between next, restart and goto
/// @arg target sets target room when using the goto mode
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SlideTransitions(mode, targetRoom){
	oTransition.mode = mode
	oTransition.target = targetRoom
}