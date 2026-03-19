// Making the tongue object follow the player as they move
// For the position of the tongue
x = obj_player.x + lengthdir_x(obj_player.sprite_width / 2, enemy_angle)
y = obj_player.y + lengthdir_y(obj_player.sprite_width / 2, enemy_angle)

// For the angle of the tongue and keeping it aligned with enemy 
image_angle = direction

// Extending state for tongue
if (state == "extending") {
    
    tongue_length += tongue_extending_speed
    
	// Once tongue has reached its range, switch states to retracting
    if (tongue_length >= tongue_range) {
        state = "retracting"
    }
}

else if (state == "retracting") {
    
    tongue_length -= tongue_extending_speed
    
    if (tongue_length <= 0) {
        instance_destroy()
    }
}

// Stretching the tongue, and using sprite_get_width since sprite_width can change after scaling
image_xscale = tongue_length / sprite_get_width(sprite_index) 