// Checks for pause
if (global.game_state != game_states.playing) {
	exit;
}

show_debug_message("Enemies remaining: " + string(instance_number(obj_enemy)));

// Added '&& alarm[0] == -1' to ensure this only triggers once
if (!instance_exists(obj_enemy) && alarm[0] <= 0) {
    
	current_wave++;
	
    if (alarm[0] == -1) {
    obj_player.evolution_message = "WAVE " + string(current_wave + 1) + " STARTING!";
    obj_player.evolution_timer = game_get_speed(gamespeed_fps) * 2; // Show for 2 seconds
	}
    
    
    // 3. START THE SPAWN TIMER
    // Setting this to a positive number immediately prevents the 'if' above from 
    // looping again on the next frame.
    alarm[0] = game_get_speed(gamespeed_fps) * 3; 
}


// Levels up the player everytime a threshold is passed
// then moves the threshold further
if (experience >= level_up_threshold || keyboard_check_pressed(vk_enter)) {
	var camera_x = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0])/2); 
	var camera_y = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0])/2); 
	
	var option_1 = instance_create_depth(camera_x - 200, camera_y + 30, -100, obj_upgrade1);
	
	var option_2 = instance_create_depth(camera_x, camera_y + 30, -100, obj_upgrade2);
		
	var option_3 = instance_create_depth(camera_x + 200, camera_y + 30, -100, obj_upgrade3);
	
	
	if (level <= 10) {
		level_up_threshold += level_up_threshold/2;
		level_up_threshold += 10;
	} else {
		level_up_threshold += level_up_threshold/4;
	}
	level++;
}

