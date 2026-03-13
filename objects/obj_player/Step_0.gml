//Speed acceleration and decceleration
//x
x += hspeed;
//Making sure the player is not moving before decelerating hspeed
if (keyboard_check(vk_right) - keyboard_check(vk_left) == 0) {
	if (hspeed > 0) {
	    hspeed -= move_deceleration;
	} else if (hspeed < 0) {
	    hspeed += move_deceleration;
	}
}

//y
y += vspeed
//Making sure the player is not moving before decelerating vspeed
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
var moving = (hspeed != 0) || (vspeed != 0)

if (moving) {
	// Changing the image angle of the player sprite based on the hspeed and vspeed
	image_angle = point_direction(0, 0, hspeed, vspeed)
	
	// Restricting the classic gamemaker problem of diagonal movement being a little faster
	// Calculating current speed by measuring distance between (0,0) and (hspeed,vspeed)
	var current_speed = point_distance(0, 0, hspeed, vspeed)
	if (current_speed > top_speed) {
		hspeed = lengthdir_x(top_speed, image_angle)
		vspeed = lengthdir_y(top_speed, image_angle)
	}
	
	//Commented for the sake of playtesting. Do we still want to include this animation?
	// Player animation begins when moving
	/*hop_timer += hop_speed 
	// Dividing by pie to better match the timing of the sin wave when switching sprite frames
	image_speed = 2 * hop_speed / pi // Multiply by the amount of frames in the animation (2 in this case)
} else { 
	image_speed = 0
	hop_timer = 0*/
} 

// Keeps the player within screen bounds
x = clamp(x, sprite_width / 2, room_width-sprite_width / 2)
y = clamp(y, sprite_height / 2, room_height-sprite_height / 2)

// Reducing the iframes cooldown every step
if (iframes_cooldown > 0) {
	iframes_cooldown--
}
