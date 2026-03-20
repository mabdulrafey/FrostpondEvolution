// if paused
if (global.game_state != game_states.playing) {
	if (!paused) {
		base_vspeed = vspeed;
		base_hspeed = hspeed;
		vspeed = 0;
		hspeed = 0;
		paused = true;
	}
	exit;
} else {
	if (paused) {
		vspeed = base_vspeed;
		hspeed = base_hspeed;
		paused = false;
	}
}