// Creating an  instance variable for enemy health using the max_hp variable def
hp = max_hp

// Initializing the damage_flash shader variables
damage_flash = 0
damage_flash_timer = 0

paused = false;

// Using states to make the fly head into the camera view when it first spawns ("enterScreen"),
// then wander randomly once they have been seen ("wandering").
state = "enterScreen"

// Creating wandering variables to control the direction of the enemy fly
wandering_current_time = 0
wandering_timer = irandom_range(60, 180) // The fly will change directions every one to three seconds
speed = 2

// Getting the center point of the camera
var camera = view_camera[0]
target_camera_x = camera_get_view_x(camera) + camera_get_view_width(camera) / 2
target_camera_y = camera_get_view_y(camera) + camera_get_view_height(camera) / 2

// Adding some variation so the fly doesn't fly straight to the camera center
target_camera_x += irandom_range(-200, 200) 
target_camera_y += irandom_range(-200, 200) 

// Initializing new_direction, which will give a random direction for the fly to go
new_direction = irandom(359)