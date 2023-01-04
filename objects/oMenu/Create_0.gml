/// @description GUI/Vars/Menu setup
#macro SAVEFILE "Save.sav"


guiWidth = display_get_gui_width()
guiHeight = display_get_gui_height()
guiMargin = 32

menuX = guiWidth + 200
menuY = guiHeight - guiMargin
menuXTarget = guiWidth - guiMargin
menuSpeed = 25
menu_font = fMenu
menuItemHeight = font_get_size(fMenu)
menuCommited = -1
menuControl = true

menu = [
	"Quit",
	"Continue",
	"New Game"
]

menuItems= array_length_1d(menu)
menuCursor= 2