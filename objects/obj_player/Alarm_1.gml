// Resetting alarm 1
alarm[1] = tongue_cooldown

// Searching for the nearest enemy to the player
var enemy = instance_nearest(x, y, obj_enemy)

if (enemy != noone) { // Checking if enemy recieves a prop er enemy id
	// Getting the distance between the player and the nearest enemy
	var distance_to_enemy = point_distance(x, y, enemy.x, enemy.y)
	
	if (distance_to_enemy <= tongue_range) {
		// Getting the angle between the player and the nearest enemy
	 	var angle_to_enemy = point_direction(x, y, enemy.x, enemy.y)
		
		// Checking if the enemy is in a 20 degree cone in front of the player
		if (abs(angle_difference(image_angle, angle_to_enemy)) < 40) {
			
			// Creating the tongue attack, moving in the direction the frog is facing
			var tongue = instance_create_layer(x + lengthdir_x(sprite_width / 2, image_angle), y + lengthdir_y(sprite_width / 2, image_angle), "Instances", obj_player_tongue)
			
			// Saving the original position (x and y values) before they change
			tongue.original_x = x
			tongue.original_y = y

			// Tongue will always face in the direction the player is facing
			tongue.direction = image_angle
			tongue.image_angle = image_angle

			// Easy way to update the values of tongue
			tongue.tongue_range = tongue_range + tongue_range_upgrade
			tongue.tongue_punch_through = tongue_punch_through + tongue_punch_through_upgrade

		}
	}
} 