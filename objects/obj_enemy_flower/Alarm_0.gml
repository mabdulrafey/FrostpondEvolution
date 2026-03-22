// Resetting alarm 0
alarm[0] = projectile_cooldown

if (global.game_state == game_states.paused || instance_exists(obj_upgrade1)) {
    exit;    
}

// Searching for the nearest enemy to the player
var player = instance_nearest(x, y, obj_player)

if (player != noone) { // Checking if enemy recieves a prop er enemy id
	// Getting the distance between the player and the nearest enemy
	var distance_to_player = point_distance(x, y, player.x, player.y)
	
	if (distance_to_player <= projectile_range) {
		// Getting the angle between the player and  the nearest enemy
	 	var angle_to_player = point_direction(x, y, player.x, player.y)
		
		// No need to make a cone of vision, shoot the player whne they're within range
		var enemy_projectile = instance_create_layer(x, y, "Instances", obj_enemy_projectile)
		enemy_projectile.direction = angle_to_player
		enemy_projectile.speed = projectile_speed 
		
		// Rotate the sprite so it faces the direction it is shot
		enemy_projectile.image_angle = enemy_projectile.direction
	}
}