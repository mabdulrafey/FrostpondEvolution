// Fixing the issue happening with the tongue stretching
gpu_set_texfilter(false);


// Creating particle system for grad requirements:

global.particle_system = part_system_create();
part_system_depth(global.particle_system, -100); // This will draw the particles above mostly all things

// Creating the particle type for player spit
global.pt_player_spit = part_type_create();

// PLAYER SPIT PARTICLE DETAILS

// Using a cloud shape for a more misty look
part_type_shape(global.pt_player_spit, pt_shape_snow);
 
// Size, small size that increases slightly.
part_type_size(global.pt_player_spit, 0.1, 0.2, 0.01, 0);

// Color, going from dark green to yellowish green
part_type_color2(global.pt_player_spit,
	make_color_rgb(57, 181, 74),
    make_color_rgb(0, 166, 81)
);

// Using transparency to fade out particle
part_type_alpha2(global.pt_player_spit, 0.8, 0);

// Lifetime between 10 to 20 frames
part_type_life(global.pt_player_spit, 10, 20);

// Speed between 0.3 to 0.8 with little variation
part_type_speed(global.pt_player_spit, 0.3, 0.8, -0.01, 0.01);

if (instance_exists(obj_player_spit)) {
	
	// Direction, creates a 20 pixel wide cone the particles will spray in
	part_type_direction(global.pt_player_spit, obj_player_spit.direction - 10, obj_player_spit.direction + 10, 0, 0);
	
} else {
	
	// Direction, going in all directions
	part_type_direction(global.pt_player_spit, 0, 360, 0, 0);
	
}

// Gravity, directed straight downwards
part_type_gravity(global.pt_player_spit, 0.05, 270);



// ENEMY PROJECTILE PARTICLE DETAILS

// Creating the particle type for player spit
global.pt_enemy_particle = part_type_create();

// Using a cloud shape for a more misty look
part_type_shape(global.pt_enemy_particle, pt_shape_snow);
 
// Size, small size that increases slightly. 
part_type_size(global.pt_enemy_particle, 0.2, 0.6, 0.01, 0);

// Color, same yellow hues as the enemy_projectile
part_type_color2(global.pt_enemy_particle,
	make_color_rgb(209, 202, 0),
    make_color_rgb(183, 177, 0)
);

// Using transparency to fade out particle
part_type_alpha2(global.pt_enemy_particle, 0.8, 0);

// Lifetime between 10 to 20 frames
part_type_life(global.pt_enemy_particle, 10, 20);

// Speed between 0.3 to 0.8 with little variation
part_type_speed(global.pt_enemy_particle, 0.3, 0.8, -0.01, 0.01);

if (instance_exists(obj_enemy_projectile)) {
	
	// Direction, creates a 20 pixel wide cone the particles will spray in
	part_type_direction(global.pt_enemy_particle, obj_enemy_projectile.direction - 10, obj_enemy_projectile.direction + 10, 0, 0);
	
} else {
	
	// Direction, going in all directions
	part_type_direction(global.pt_enemy_particle, 0, 360, 0, 0);
	
}

// Gravity, directed straight downwards
part_type_gravity(global.pt_enemy_particle, 0.05, 270);

// Randomize the game
randomize();

enum game_states {
	playing,
	paused,
}

global.game_state = game_states.playing;