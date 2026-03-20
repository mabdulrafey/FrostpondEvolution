if (global.game_state != game_states.playing) {
	if (!paused) {
		base_vspeed = vspeed;
		base_hspeed = hspeed;
		vspeed = 0;
		hspeed = 0;
		paused = true;
	}
	exit;
} else {
	if (paused) {
		vspeed = base_vspeed;
		hspeed = base_hspeed;
		paused = false;
	}
}

// Honing in on the player
// If the player object exists
if (instance_exists(obj_player)) {
	player_dist = distance_to_object(obj_player)
	
	// If the player is within the attack range of the enemy
	if (player_dist < attack_range) {
		direction = point_direction(x, y, obj_player.x, obj_player.y)
		speed = move_speed
		 
		// Rotate the enemy frog sprite towards the player
		image_angle = direction
	} else {
		speed = 0 // Stop the movement if they no longer see the player
	}

} 

// Preventing enemies from clipping into eachother
with (obj_enemy) { // Runs this code once for very existing enemy
    if (id != other.id) { // Using id to easily check the other enemy instances
        var distance = point_distance(x, y, other.x, other.y)
         
        if (distance < 20) { // If they are closer than 20 pixels to eachother
            var direct = point_direction(x, y, other.x, other.y)
			
			// Using their directions to slighty push enemies away from eachother
            other.x += lengthdir_x(0.5, direct)
            other.y += lengthdir_y(0.5, direct)
        }
    }
}

// Keeps the enemy within screen bounds
x = clamp(x, sprite_width / 2, room_width-sprite_width / 2)
y = clamp(y, sprite_height / 2, room_height-sprite_height / 2)

// Reducing the iframes cooldown every step
if (iframes_cooldown > 0) {
	iframes_cooldown--
}