// Inherit the parent event
event_inherited();

// Checking if the enemy frog is moving
var moving = (speed != 0)

if (moving) {
	
	// Increasing the hop timer until it's greater than the duration 
	hop_timer += 1
	if (hop_timer >= hop_duration) {
		hop_timer = 0	
	}
	
	// Have to convert the timer to 0 to 1 range because of Animation Curve, can't use frames
	var normalized_hop_timer = hop_timer / hop_duration
	hop_curve_value = animcurve_channel_evaluate(hop_channel, normalized_hop_timer)
	
		// Changing the frog sprite's frame not based on image_speed, but based on hop_curve_value
	if (hop_curve_value > 0.2) {
		image_index = 1 	
	} else {
		image_index = 0	
	}
		
} else { 
	// Enemy frog will slowly land back on the ground, using lerp to smoothly approach 0 from hop_curve_value
    hop_curve_value = lerp(hop_curve_value, 0, 0.2);

    // Additional snapping when hop_curve_value is super low just to make sure the enemy is in the right position when drawn
    if (abs(hop_curve_value) < 0.01) {
		// Setting the hop values to 0
        hop_curve_value = 0;
        hop_timer = 0; 
    }
} 
