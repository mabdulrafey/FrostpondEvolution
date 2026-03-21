direction = image_angle

// Initializing the stats for the tongue attack
tongue_damage = obj_player.tongue_damage
tongue_punch_through = obj_player.tongue_punch_through
tongue_range = obj_player.tongue_range
audio_play_sound(tongue_sound, 1, false);


// Controlling the extending and retracting of the tongue
state = "extending"

tongue_length = 1 // The length of the tongue begins with 1
tongue_extending_speed = 12 // Adjust this value to adjust the speed of the tongue attack

