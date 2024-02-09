hspd = random_range(1.5, 2.5)
vspd = 0
grounded = true
jumpTimer = irandom_range(40, 350)
dead = false
dietimer = 0
myCharacter = choose("Mario", "Luigi", "Toad", "Wario", "Goomba")
index = 0
big = choose(true, false)
if !big {
	mask_index = sMariomask0
	jump = ms("sMario_s_jump", myCharacter)
	walk = ms("sMario_s_walk", myCharacter)
} else {
	mask_index = sMariomask1
	jump = ms("sMario_b_jump", myCharacter)
	walk = ms("sMario_b_walk", myCharacter)
}