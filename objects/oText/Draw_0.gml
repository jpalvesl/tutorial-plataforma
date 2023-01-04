/// @description 

var halfW = width * 0.5

// Draw the box
draw_set_color(c_black)
draw_set_alpha(0.5)
draw_roundrect_ext(x-halfW-margin, y-heigth-(margin*2), x+halfW+margin, y, 15, 15, false)
draw_sprite(sMarker, 0, x, y+1)
draw_set_alpha(1)

// Draw text
DrawSetText(c_white, fSign, fa_center, fa_top)
draw_text(x, y-heigth-margin, textCurrent)