// Wave 1: 
// Spawns 3 level 1 tadpoles
if (current_wave == 0) {
	scr_spawning(3, obj_enemy_tadpole, x, x + sprite_width, y, y + sprite_height);
	alarm[0] = game_get_speed(gamespeed_fps) * (5 + random(3));
	current_wave++;
} 
// Wave 2: 
// Spawns 3-6 level 1 tadpoles
else if (current_wave == 1) {
	scr_spawning(3 + irandom(3), obj_enemy_tadpole, x, x + sprite_width, y, y + sprite_height);
	alarm[0] = game_get_speed(gamespeed_fps) * (5 + random(3));
	current_wave++;
} 
// Wave 3: 
// Spawns 3-6 level 1 tadpoles
// And 1-3 fish
else if (current_wave == 2) {
	scr_spawning(3 + irandom(3), obj_enemy_tadpole, x, x + sprite_width, y, y + sprite_height);
	scr_spawning(irandom(3), obj_enemy_fish, x, x + sprite_width, y, y + sprite_height);
	alarm[0] = game_get_speed(gamespeed_fps) * (5 + random(3));
	current_wave++;
} 