// If the fly is destroyed, restore player health
if (instance_exists(obj_player)) {
	obj_player.hp = obj_player.max_hp
}