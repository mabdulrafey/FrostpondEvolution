// Inherit the parent event
event_inherited();

image_speed = 0.25

// Fixing the image_angle of the enemy fish so it doesn't run upside down
var current_direction = direction

// Flip the enemy fish sprite before their sprite flips upside down
if (current_direction > 90 && current_direction < 270) {
	
	image_xscale = -1
	image_angle = current_direction + 180
	
} else {
	
	image_xscale = 1
	image_angle = current_direction
	
}
