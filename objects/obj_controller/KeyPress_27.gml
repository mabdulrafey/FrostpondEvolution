if (global.game_state == game_states.playing) {
    // 1. Change state FIRST so other objects see the pause immediately
    global.game_state = game_states.paused;
    
    // 2. Kill the specific spit sound so it can't "ghost" play
    audio_stop_sound(spit_sound); // Replace 'snd_spit' with your actual sound asset name
    
    // 3. Pause everything else
    audio_pause_all();
    
    // 4. Play the pause menu sound AFTER the pause_all command 
    // so the menu sound itself doesn't get muted!
    audio_play_sound(pause, 1, false);
} 
else if (global.game_state == game_states.paused && !instance_exists(obj_upgrade1)) {
    // 1. Change state back to playing
    global.game_state = game_states.playing;
    
    // 2. Resume the background music/ambient sounds
    audio_resume_all(); 
    
    // 3. Play the "resume" click sound
    audio_play_sound(pause, 1, false);
}