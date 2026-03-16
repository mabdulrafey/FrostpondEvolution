show_debug_message("Enemies remaining: " + string(instance_number(obj_enemy)));

if (!instance_exists(obj_enemy) && alarm[0] <= 0) {
    
    // 1. Advance the wave counter (now it never resets!)
    current_wave++;
    
    // 2. Set the timer for the next spawn
    // The delay stays 5 seconds, but you could even make this shorter as waves go up!
    alarm[0] = game_get_speed(gamespeed_fps) * 5; 
}