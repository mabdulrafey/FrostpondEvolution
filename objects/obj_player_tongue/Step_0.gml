// Logic for moving out and coming back
if (state == "extending") {
    tongue_length += extend_speed;
    
    // Switch to retracting once it hits the range you set in Variable Definitions
    if (tongue_length >= tongue_range) {
        state = "retracting";
    }
} 
else if (state == "retracting") {
    tongue_length -= extend_speed;
    
    // Destroy once it's fully back at the player
    if (tongue_length <= 0) {
        instance_destroy();
    }
}

// Visual stretch logic
if (sprite_width > 0) {
    image_xscale = tongue_length / sprite_get_width(sprite_index);
}