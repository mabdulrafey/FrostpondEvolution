// Kick off the first wave after 3 seconds
alarm[0] = game_get_speed(gamespeed_fps) * 3;

// Trigger the Wave 1 message immediately when the game starts
if (instance_exists(obj_player)) {
    obj_player.evolution_message = "WAVE " + string(current_wave + 1) + " STARTING!";
    obj_player.evolution_timer = game_get_speed(gamespeed_fps) * 2;
}