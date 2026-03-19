// Checks for pause
if (global.game_state != game_states.playing) {
	if (!paused) {
		base_vspeed = vspeed;
		base_hspeed = hspeed;
		vspeed = 0;
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

show_debug_message("Enemies remaining: " + string(instance_number(obj_enemy)));

if (!instance_exists(obj_enemy) && alarm[0] <= 0) {
    
    // --- ANNOUNCE NEW WAVE ---
	// This sends the wave info to the player's screen message
	if (instance_exists(obj_player)) {
		obj_player.evolution_message = "WAVE " + string(current_wave + 1) + " STARTING!";
		obj_player.evolution_timer = game_get_speed(gamespeed_fps) * 2; // Show for 2 seconds
	}
    // Set the timer for the next spawn
    // The delay stays 5 seconds, but you could even make this shorter as waves go up!
    alarm[0] = game_get_speed(gamespeed_fps) * 3; 
}


// Levels up the player everytime a threshold is passed
// then moves the threshold further
if (experience >= level_up_threshold) {
	instance_create_layer(0, 0, "Instances", obj_upgrade)
	
	if (level <= 10) {
		level_up_threshold += level_up_threshold;
		level_up_threshold += 10;
	} else {
		level_up_threshold *= 1.1;
	}
	level++;
}