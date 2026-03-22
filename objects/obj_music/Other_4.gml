// Check which room we just entered
if (room == rm_pond) {
    // 1. Stop the menu music
    audio_stop_sound(initialscreensound);
    
    // 2. Start the in-game music if it's not already playing
    if (!audio_is_playing(ingamesound)) {
        audio_play_sound(ingamesound, 10, true);
        // Set volume to 50% (0.5). Change this number to go lower (e.g., 0.2)
        audio_sound_gain(ingamesound, 0.5, 0); 
    }
} 
else if (room == rm_Initialize) {
    audio_stop_sound(ingamesound);
    
    if (!audio_is_playing(initialscreensound)) {
        audio_play_sound(initialscreensound, 10, true);
        // Set menu volume to 50%
        audio_sound_gain(initialscreensound, 0.5, 0);
    }
}