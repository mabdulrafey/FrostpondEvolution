// Fixing the issue happening with the tongue stretching
gpu_set_texfilter(false);

// Randomize the game
randomize();

room_goto(rm_pond);

enum game_states {
	playing,
	paused,
}

global.game_state = game_states.playing;

global.paused = false;