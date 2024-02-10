draw_set_alpha(0.9)
draw_set_color(c_black)
draw_rectangle(0, 0, SCREENW, SCREENH, false)
draw_set_color(c_white)
draw_set_alpha(1)
draw_set_halign(fa_center)
draw_set_font(global.fnt)
draw_text(SCREENW / 2, 32, "PAUSED")
for (var i = 0; i < array_length(options); i++) {
	draw_text(SCREENW/2, 100 + (16 * i), options[i])
}
draw_sprite(sMushsel, 0, SCREENW/2 - ((string_width(options[selected]) / 2) + 16), 100 + (16 * selected))
draw_set_halign(fa_left)