// --- MOVEMENT & PHYSICS ---

// Speed acceleration and deceleration
// x
x += hspeed;
// Making sure the player is not moving before decelerating hspeed
if (keyboard_check(vk_right) - keyboard_check(vk_left) == 0) {
	if (hspeed > 0) {
		hspeed -= move_deceleration;
	} else if (hspeed < 0) {
		hspeed += move_deceleration;
	}
}

// y
y += vspeed;
// Making sure the player is not moving before decelerating vspeed
if (keyboard_check(vk_down) - keyboard_check(vk_up) == 0) {
	if (vspeed > 0) {
		vspeed -= move_deceleration;
	} else if (vspeed < 0) {
		vspeed += move_deceleration;
	}
}

// Any speeds below 0.2 will be set to 0 to prevent the player object image angle freaking out
if (abs(hspeed) < move_deceleration) hspeed = 0;
if (abs(vspeed) < move_deceleration) vspeed = 0;

// Player input/movement
if keyboard_check(vk_left) {
	hspeed -= move_acceleration;
}
if keyboard_check(vk_right) {
	hspeed += move_acceleration;
}
if keyboard_check(vk_up) {
	vspeed -= move_acceleration;
}
if keyboard_check(vk_down) {
	vspeed += move_acceleration;
}

// Checking if the player is moving
var moving = (hspeed != 0) || (vspeed != 0);

if (moving) {
	// Changing the image angle of the player sprite based on the hspeed and vspeed
	image_angle = point_direction(0, 0, hspeed, vspeed);
	
	// Restricting the classic gamemaker problem of diagonal movement being a little faster
	var current_speed = point_distance(0, 0, hspeed, vspeed);
	if (current_speed > top_speed) {
		hspeed = lengthdir_x(top_speed, image_angle);
		vspeed = lengthdir_y(top_speed, image_angle);
	}
	
} else { 
	// Stop animation and reset to the first frame when still
	image_speed = 0;
	image_index = 0;
	
} 

// Keeps the player within screen bounds
x = clamp(x, sprite_width / 2, room_width - sprite_width / 2);
y = clamp(y, sprite_height / 2, room_height - sprite_height / 2);

// Reducing the iframes cooldown every step
if (iframes_cooldown > 0) {
	iframes_cooldown--;
}

// --- EVOLUTION LOGIC ---

// Stage 1: Evolve to Tadpole with Legs at 70 points
if (obj_waves.score_total >= 70 && evolve == 0) {
	evolve = 1;
	sprite_index = spr_player_legs; 
	
	// Set the message to show on screen
	evolution_message = "EVOLVED TO TADPOLE WITH LEGS!\nTONGUE UNLOCKED";
	evolution_timer = game_get_speed(gamespeed_fps) * 3; // Message lasts 3 seconds
	
	show_debug_message("Evolved to Stage 1!");
}

// Countdown the evolution message timer
if (evolution_timer > 0) {
	evolution_timer--;
} else {
	evolution_message = ""; 
}
 // Example Stage 2: Evolve to Frog at 300 points
if (obj_waves.score_total >= 300 && evolve == 1) {
	evolve = 2;
	sprite_index = spr_player_frog;
	
	evolution_message = "EVOLVED TO FULL FROG!\nULTIMATE POWER UNLOCKED";
	evolution_timer = game_get_speed(gamespeed_fps) * 3;
	
	show_debug_message("Evolved to Stage 2!");
}
