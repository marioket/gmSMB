if !dead {
	if onview() {
		dead = true
		sfx(sndDieShort, 0)
	}
}