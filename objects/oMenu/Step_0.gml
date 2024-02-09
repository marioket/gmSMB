marioSpawnTimer--
if marioSpawnTimer <= 0 {
	marioSpawnTimer = irandom_range(60, 180)
	instance_create_depth(-96, 208, depth + 1, oMarioRunner)
}