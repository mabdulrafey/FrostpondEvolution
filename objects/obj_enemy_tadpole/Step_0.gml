// If the player object exists
if (instance_exists(obj_player)) {
	player_dist = distance_to_object(obj_player)
	
	// If the player is within the attack range of the enemy frog
	if (player_dist < attack_range) {
		direction = point_direction(x, y, obj_player.x, obj_player.y)
		speed = move_speed
		
		// Rotate the enemy frog sprite towards the player
		image_angle = direction
	} else {
		speed = 0 // Stop the movement if they no longer see the player
	}

} 

// Checking if the enemy frog is moving
var moving = (speed != 0)

if (moving) {
	hop_timer += hop_speed
} else { 
	hop_timer = 0
} 

// Keeps the enemy frog within screen bounds
x = clamp(x, sprite_width / 2, room_width-sprite_width / 2)
y = clamp(y, sprite_height / 2, room_height-sprite_height / 2)

// Preventing enemy frogs from clipping into eachother
with (obj_enemy_tadpole) { // Runs this code once for very existing enemy frog
    if (id != other.id) { // Using id to easily check the other frog instances
        var distance = point_distance(x, y, other.x, other.y)
         
        if (distance < 20) { // If they are closer than 20 pixels to eachother
            var direct = point_direction(x, y, other.x, other.y)
			
			// Using their directions to slighty push enemy frogs away from eachother
            other.x += lengthdir_x(0.5, direct)
            other.y += lengthdir_y(0.5, direct)
        }
    }
}

// Reducing the iframes cooldown every step
if (iframes_cooldown > 0) {
	iframes_cooldown--
}
