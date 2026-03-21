// Enemy frog does not use hspeed or vspeed, but uses speed for honing in on the player

// If the player object exists
if (instance_exists(obj_player)) {
	// The enemy frog will spawn looking at the player
	direction = point_direction(x, y, obj_player.x, obj_player.y)
	
	// Enemy frogs will spawn looking at the player
	image_angle = direction
}

// Creating an instance variable for enemy health using the max_hp variable def
hp = max_hp

// Initializing the damage_flash shader variables
damage_flash = 0
damage_flash_timer = 0
	
// Getting the hop Animation Curve and the first channel
hop_curve_value = 0;
hop_curve = animcurve_get(ac_hop)
hop_channel = animcurve_get_channel(hop_curve, 0)

// No animations when it first spawns
image_speed = 0 

paused = false;