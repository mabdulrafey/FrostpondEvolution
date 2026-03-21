// Resetting alarm 1
alarm[1] = tongue_cooldown

// --- EVOLUTION CHECK ---
// Only run the search and attack logic if the player has evolved
if (obj_waves.level >= 5) {

    // Searching for the nearest enemy to the player
    var enemy = instance_nearest(x, y, obj_enemy)

    if (enemy != noone) { 
        var distance_to_enemy = point_distance(x, y, enemy.x, enemy.y)
        
        if (distance_to_enemy <= tongue_range) {
            var angle_to_enemy = point_direction(x, y, enemy.x, enemy.y)
            
            // Checking if the enemy is in a 30 degree cone in front of the player
			// Not needed though when doing omni-directional hits
            //if (abs(angle_difference(image_angle, angle_to_enemy)) < 30) {
                
                // Making sure the tongue attack isn't already active
                if (instance_exists(obj_player_tongue) == false) {
                    var tongue = instance_create_layer(x + lengthdir_x(sprite_width / 2, image_angle), y + lengthdir_y(sprite_width / 2, image_angle), "Instances", obj_player_tongue)
                
                    tongue.original_x = x
                    tongue.original_y = y
					
					// Storing the enemy and making the tongue shoots towards the enemy
					tongue.enemy_angle = angle_to_enemy
					tongue.direction = angle_to_enemy
					tongue.image_angle = angle_to_enemy

                }
            //}
        }
    }
}