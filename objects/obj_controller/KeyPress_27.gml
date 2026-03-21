audio_play_sound(pause, 1, false);
if (global.game_state == game_states.playing) {
		global.game_state = game_states.paused;
} else if (global.game_state == game_states.paused && !instance_exists(obj_upgrade1)) {
	global.game_state = game_states.playing
}