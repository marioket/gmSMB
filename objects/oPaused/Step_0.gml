if keyboard_check_pressed(global.keyd) {
	selected++
	if selected > array_length(options) - 1
		selected = 0
}
if keyboard_check_pressed(global.keyu) {
	selected--
	if selected < 0
		selected = array_length(options) - 1
}
if keyboard_check_pressed(global.keyj)  {
	switch selected {
		case 0:
			instance_activate_all()
			instance_destroy()
		break;
		case 1:
			sfx(sndBump, 0)
		break;
		case 2:
			instance_activate_all()
			room_goto(rmTitle)
		break;
	}
}