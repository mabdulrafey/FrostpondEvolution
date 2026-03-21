if (global.game_state != game_states.playing) {
	if (!paused) {
		base_vspeed = vspeed;
		base_hspeed = hspeed;
		vspeed = 0;
		hspeed = 0;
		paused = true;
	}
	exit;
} else {
	if (paused) {
		vspeed = base_vspeed;
		hspeed = base_hspeed;
		paused = false;
	}
}

image_speed = 0.25

// Preventing enemies from clipping into eachother
with (obj_enemy) { // Runs this code once for very existing enemy
    if (id != other.id) { // Using id to easily check the other enemy instances
        var distance = point_distance(x, y, other.x, other.y)
         
        if (distance < 20) { // If they are closer than 20 pixels to eachother
            var direct = point_direction(x, y, other.x, other.y)
			
			// Using their directions to slighty push enemies away from eachother
            other.x += lengthdir_x(0.5, direct)
            other.y += lengthdir_y(0.5, direct)
        }
    }
}

// Keeps the enemy within screen bounds
x = clamp(x, sprite_width / 2, room_width-sprite_width / 2)
y = clamp(y, sprite_height / 2, room_height-sprite_height / 2)

// Reducing the iframes cooldown every step
if (iframes_cooldown > 0) {
	iframes_cooldown--
}

// Fades the damage_flash shader every step
if (damage_flash_timer > 0) {
	damage_flash_timer--
	
	damage_flash = damage_flash_timer / 30 //Using 30 frames for half a second
} else {
	damage_flash = 0
}

// State Logic for having the fly wander to the player, then switch states to wandering
if (state == "enterScreen") {
	
	var camera_point_direction = point_direction(x, y, target_camera_x, target_camera_y)
	direction = camera_point_direction
	image_angle = direction
	speed = 3 // Get to the camera point faster
	
	// Getting all the camera values
	var camera = view_camera[0]
	var camera_x = camera_get_view_x(camera)
	var camera_y = camera_get_view_y(camera)
	var camera_w = camera_get_view_width(camera)
	var camera_h = camera_get_view_height(camera)
	
	// If the fly is within 50 pixels of the selected camera point, it will change into its wandering state
	if (point_distance(x, y, target_camera_x, target_camera_y) < 50) {
		state = "wandering";
		wandering_timer = 0;
	}
	
}

// State Logic for having the fly wander after having reached near its chosen camera point
if (state == "wandering") {
	
	// Changing direction based on the current wandering time
	wandering_current_time--
	
	if (wandering_current_time <= 0) {
		new_direction = irandom(359)
		wandering_current_time = wandering_timer
		wandering_timer	= irandom_range(60, 180) // Setting a new random interval for how long the fly wanders a direction
		
	}
	
	// Smoother turning for the fly using lerp()
	direction = lerp(direction, new_direction, 0.10)
	
	// Some final randomness to the direction of the fly
	direction += irandom_range(-5, 5)
	image_angle = direction

	// Keeping a slow speed for the wandering fly
	speed = 1
}