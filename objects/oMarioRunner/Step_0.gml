if !dead {
	collide()
	if !grounded
		sprite_index = jump
	else
		sprite_index = walk
	index += abs(hspd)/7

	jumpTimer--
	if jumpTimer <= 0 {
		jumpTimer = irandom_range(80, 300)
		vspd = irandom_range(-6, -15) -(abs(hspd)/6)
	}
	if x >= room_width + 64
		instance_destroy()
} else{
	x += hspd
	y += vspd
	dietimer++
	sprite_index = ms("sMario_s_die", myCharacter)
	if dietimer < 40
	{hspd = 0; vspd = 0;}
	if dietimer = 40
	{vspd = -4.5;}
	if dietimer > 40
	{vspd += 0.2;}
	if y >= room_height + 64
		instance_destroy()
}
image_index = index