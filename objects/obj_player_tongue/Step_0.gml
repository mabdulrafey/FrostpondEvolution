// Extending state for tongue
if (state == "extend") {
    
    tongue_length += extend_speed
    
	// Once tongue has reached its range, switch states to retracting
    if (tongue_length >= tongue_range) {
        state = "retracting"
    }
}

else if (state == "retracting") {
    
    tongue_length -= extend_speed
    
    if (tongue_length <= 0) {
        instance_destroy()
    }
}

// Having to do this to prevent division by 0, NOT WORKING YET
//if (sprite_get_width(sprite_index) > 0) {
	// Visually stretching the tongue sprite using xscale and yscale
	//image_xscale = tongue_length / sprite_get_width(sprite_index)
	//image_yscale = 2
//}

