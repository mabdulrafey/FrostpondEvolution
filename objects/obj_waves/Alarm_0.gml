if (current_wave == 0) {
	spawning = irandom(4)
	for (i = 0; i < spawning; i++) {
		instance_create_layer(380 + irandom(200), 127 + irandom(160), 0, obj_enemy_tadpole)
	}
	alarm[0] = game_get_speed(gamespeed_fps)*10
}