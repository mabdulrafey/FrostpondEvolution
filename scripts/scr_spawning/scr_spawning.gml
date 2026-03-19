// Takes in how many enemies it wants to spawn, the enemy type, 
// then the numbers to calculate a random number within the area
function scr_spawning(enemies, enemy_type, area_x1, area_x2, area_y1, area_y2) {
	for (i = 0; i < enemies; i++) {
		instance_create_layer(
		area_x1 + irandom(area_x2 - area_x1), 
		area_y1 + irandom(area_y2 - area_y1), 
		"Instances", 
		enemy_type);
	}
}