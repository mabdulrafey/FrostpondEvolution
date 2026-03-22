// Resetting alarm 0
alarm[0] = spit_cooldown

if (global.game_state == game_states.paused || instance_exists(obj_upgrade1)) {
    exit;    
}
// Checks for upgrading
if (instance_exists(obj_upgrade1)) {
	exit;	
}

// Searching for the nearest enemy to the player
var enemy = instance_nearest(x, y, obj_enemy)

if (enemy != noone) { // Checking if enemy recieves a prop er enemy id
	// Getting the distance between the player and the nearest enemy
	var distance_to_enemy = point_distance(x, y, enemy.x, enemy.y)
	
	if (distance_to_enemy <= spit_range) {
		// Getting the angle between the player and the nearest enemy
	 	var angle_to_enemy = point_direction(x, y, enemy.x, enemy.y)
		
		// Checking if the enemy is in a 90 degree cone in front of the player
		//if (abs(angle_difference(image_angle, angle_to_enemy)) < 90) {
			var spit = instance_create_layer(x, y, "Instances", obj_player_spit)
			spit.direction = angle_to_enemy
			spit.speed = spit_speed
			spit.image_angle = spit.direction
		//}
		
	}
}