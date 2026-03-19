// This function takes in the # of enemies spawning, and their type
function scr_spawning(enemy_count, enemy_type) {
	
	// Getting the current camera the player sees through and its properties
	var camera = view_camera[0]
	var camera_x = camera_get_view_x(camera)
	var camera_y = camera_get_view_y(camera)
	var camera_w = camera_get_view_width(camera)
	var camera_h = camera_get_view_height(camera)
	
	// buffer will control how far away from the camera edges enemies can start spawning
	var buffer = 50
	
	// Used to check how much room is remaining on a side after accounting for camera and buffer
	// The amount of space remaining for enemies to spawn must be greater than min_spawn_zone
	var min_spawn_zone = 200
	
	// Used to keep the enemies from spawning too far away from the player and prevent the early waves from being a goose chase
	// Enemies can only spawn between 200 and 400 pixels away from the camera edge + buffer
	var max_spawn_dist = irandom_range(100, 300)
	
	// Getting dynamic margins for the positions the enemies spawn in
	var horizontal_margin = camera_w * 0.25
	var vertical_margin = camera_h * 0.25
	
	// Using and array to store which sides of the screen are currently a valid spawning side
	var valid_sides = []
	
	

	// Now finally checking in each direction if it is a valid spawning site
	
	// Left side of camera
	if (camera_x - buffer > min_spawn_zone) {
		array_push(valid_sides, 0)
	}
	
	// Right side of camera
	if (room_width - (camera_x + camera_w + buffer) > min_spawn_zone) {
		array_push(valid_sides, 1)
	}
	
	// Top side of camera
	if (camera_y - buffer > min_spawn_zone) {
		array_push(valid_sides, 2)
	}
	
	// Bottom side of camera
	if (room_height - (camera_y + camera_h + buffer) > min_spawn_zone) {
		array_push(valid_sides, 3)
	}
	
	// SHOULD NOT HAPPEN with a large room, but simple case to prevent errors if somehow no sides are valid
	if (array_length(valid_sides) == 0) {
		return
	}
	
	
	
	// Spawning as meny enemies specified by enemy_count
	for (var i = 0; i < enemy_count; i++) {
		var random_side = valid_sides[irandom(array_length(valid_sides) - 1)] // Choosing a random valid side
		
		var spawn_x, spawn_y
		// Must include the use of min() and max() for x and y positions!
		// Lots of values are being calculated here, and especially with the introduction of margins,
		// min() and max() are used to clamp values so nothing spawns outside of the room
		var min_x, max_x, min_y, max_y
		
		switch(random_side) {
			
			case 0: // Side 0: Left side of the room
				min_x = max(0, camera_x - max_spawn_dist)
				max_x = camera_x - buffer
				
				min_y = max(0, camera_y - vertical_margin)
				max_y = min(room_height, camera_y + camera_h + vertical_margin)
			
				spawn_x = irandom_range(min_x, max_x) 
				spawn_y = irandom_range(min_y, max_y)
				break
				
			case 1: // Side 1: Right side of the room
				min_x = camera_x + camera_w + buffer
				max_x = min(room_width, camera_x + camera_w + max_spawn_dist)
				
				min_y = max(0, camera_y - vertical_margin)
				max_y = min(room_height, camera_y + camera_h + vertical_margin)
			
				spawn_x = irandom_range(min_x, max_x)
				spawn_y = irandom_range(min_y, max_y)
				break
				
			case 2: // Side 2: Top of the room
				min_x = max(0, camera_x - horizontal_margin)
				max_x = min(room_width, camera_x + camera_w + horizontal_margin)
				
				min_y = max(0, camera_y - max_spawn_dist)
				max_y = camera_y - buffer
			
				spawn_x = irandom_range(min_x, max_x)
				spawn_y = irandom_range(min_y, max_y)
				break
				
			case 3: // Side 3: Bottom of the room
				min_x = max(0, camera_x - horizontal_margin)
				max_x = min(room_width, camera_x + camera_w + horizontal_margin)
				
				min_y = camera_y + camera_h + buffer
				max_y = min(room_height, camera_y + camera_h + max_spawn_dist)
				
				spawn_x = irandom_range(min_x, max_x)
				spawn_y = irandom_range(min_y, max_y)
				break

		}
		
		// Finally creating the instance of the enemy 
		instance_create_layer(spawn_x, spawn_y, "Instances", enemy_type)
	}
	
}