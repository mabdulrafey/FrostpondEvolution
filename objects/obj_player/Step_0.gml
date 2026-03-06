// Setting hspeed and vspeed to zero if the player isn't holding anything
hspeed = 0
vspeed = 0


// Player movement and changing the way the player faces
if (keyboard_check(vk_right)) {
	hspeed = move_speed
	image_angle = 270
}
if (keyboard_check(vk_left)) {
	hspeed = -move_speed
	image_angle = 90
}
if (keyboard_check(vk_up)) {
	vspeed = -move_speed
	image_angle = 0
}
if (keyboard_check(vk_down)) {
	vspeed = move_speed
	image_angle = 180
}
// Changing image angle to face diagonally if two keys are held at once
if (keyboard_check(vk_up)) && (keyboard_check(vk_right)) {
	image_angle = 315
}
if (keyboard_check(vk_right)) && (keyboard_check(vk_down)) {
	image_angle = 225
}
if (keyboard_check(vk_down)) && (keyboard_check(vk_left)) {
	image_angle = 135
}
if (keyboard_check(vk_left)) && (keyboard_check(vk_up)) {
	image_angle = 45
}


// Checking if the player is moving
var moving = (hspeed != 0) || (vspeed != 0)

if (moving) {
	hop_timer += hop_speed
} else { 
	hop_timer = 0
} 

// Keeps the player within screen bounds
x = clamp(x, sprite_width / 2, room_width-sprite_width / 2)
y = clamp(y, sprite_height / 2, room_height-sprite_height / 2)
