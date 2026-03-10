// Setting hspeed and vspeed to zero if the player isn't holding anything
hspeed = 0
vspeed = 0


// Player movement
if (keyboard_check(vk_right)) {
	hspeed = move_speed
}
if (keyboard_check(vk_left)) {
	hspeed = -move_speed
}
if (keyboard_check(vk_up)) {
	vspeed = -move_speed
}
if (keyboard_check(vk_down)) {
	vspeed = move_speed
}

// Checking if the player is moving
var moving = (hspeed != 0) || (vspeed != 0)

if (moving) {
	// Changing the image angle of the player sprite based on the hspeed and vspeed
	image_angle = point_direction(0, 0, hspeed, vspeed)
	
	// Restricting the classic gamemaker problem of diagonal movement being a little faster
	// Calculating current speed by measuring distance between (0,0) and (hspeed,vspeed)
	var current_speed = point_distance(0, 0, hspeed, vspeed)
	if (current_speed > move_speed) {
		hspeed = lengthdir_x(move_speed, image_angle)
		vspeed = lengthdir_y(move_speed, image_angle)
	}
	
	// Player animation begins when moving
	hop_timer += hop_speed 
	// Dividing by pie to better match the timing of the sin wave when switching sprite frames
	image_speed = 2 * hop_speed / pi // Multiply by the amount of frames in the animation (2 in this case)
} else { 
	image_speed = 0
	hop_timer = 0
} 

// Keeps the player within screen bounds
x = clamp(x, sprite_width / 2, room_width-sprite_width / 2)
y = clamp(y, sprite_height / 2, room_height-sprite_height / 2)

// Reducing the iframes cooldown every step
if (iframes_cooldown > 0) {
	iframes_cooldown--
}

