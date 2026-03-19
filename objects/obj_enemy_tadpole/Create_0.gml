// Enemy frog does not use hspeed or vspeed, but uses speed for honing in on the player
my_value = 5 
// If the player object exists
if (instance_exists(obj_player)) {
	// The enemy frog will spawn looking at the player
	direction = point_direction(x, y, obj_player.x, obj_player.y)
	
	// Enemy frogs will spawn looking at the player
	image_angle = direction
}

// Creating an instance variable for enemy health using the max_hp variable def
hp = max_hp

paused = false;