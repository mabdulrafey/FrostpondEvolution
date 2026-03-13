// Speed acceleration and decceleration
// x
// Note: We don't use x += hspeed here because GameMaker's built-in hspeed moves the object automatically.
if (hspeed > 0) {
    hspeed = max(0, hspeed - move_deceleration);
} else if (hspeed < 0) {
    hspeed = min(0, hspeed + move_deceleration);
}

// y
if (vspeed > 0) {
    vspeed = max(0, vspeed - move_deceleration);
} else if (vspeed < 0) {
    vspeed = min(0, vspeed + move_deceleration);
}

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

// Keeps the player within screen bounds
x = clamp(x, sprite_width / 2, room_width-sprite_width / 2)
y = clamp(y, sprite_height / 2, room_height-sprite_height / 2)

// Checking if the player is moving - using a small threshold (0.1) to prevent flickering/spinning
var moving = (abs(hspeed) > 0.1) || (abs(vspeed) > 0.1)

if (moving) {
	// Changing the image angle of the player sprite based on the hspeed and vspeed
	image_angle = point_direction(0, 0, hspeed, vspeed)
	
	// Restricting the classic gamemaker problem of diagonal movement being a little faster
	var current_speed = point_distance(0, 0, hspeed, vspeed)
	if (current_speed > top_speed) {
		hspeed = lengthdir_x(top_speed, image_angle)
		vspeed = lengthdir_y(top_speed, image_angle)
	}
	
	// Player animation begins when moving
	// We set image_speed to a low value since you only have 2 frames
	//Commented for the sake of playtesting. Do we still want to include this animation?
	// Player animation begins when moving
	//hop_timer += hop_speed
	// Dividing by pie to better match the timing of the sin wave when switching sprite frames
	//image_speed = 2 * hop_speed / pi // Multiply by the amount of frames in the animation (2 in this case)
	image_speed = 0.2; 
    
} else { 
    // Stop animating and reset to the "idle/sitting" frame (Frame 0)
	image_speed = 0;
	image_index = 0;
    
    // Completely kill the speed when very low so the frog doesn't slide forever
    if (abs(hspeed) < 0.1) hspeed = 0;
    if (abs(vspeed) < 0.1) vspeed = 0;
} 

// Keeps the player within screen bounds (Final check)
x = clamp(x, sprite_width / 2, room_width-sprite_width / 2)
y = clamp(y, sprite_height / 2, room_height-sprite_height / 2)

// Reducing the iframes cooldown every step
if (iframes_cooldown > 0) {
	iframes_cooldown--
}