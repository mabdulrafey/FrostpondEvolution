if (global.game_state == game_states.playing) {
		global.game_state = game_states.paused;
} else if (global.game_state == game_states.paused) {
	global.game_state = game_states.playing
}