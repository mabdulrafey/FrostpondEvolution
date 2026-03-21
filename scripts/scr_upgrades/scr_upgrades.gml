function scr_upgrades(chosen_upgrade) {
	switch (chosen_upgrade) {
		// Player
		// HP
		case 0:
			obj_player.max_hp *= 1.1;
			// Heal the player as well
			obj_player.hp *= 1.1;
		break;
		// movement speed
		case 1:
			obj_player.move_acceleration *= 1.25;
			obj_player.top_speed *= 1.25;
		break;
		
		// Spit
		// Projectile Speed
		case 2:
			obj_player.spit_speed *= 1.25;
		break;
		// Damage
		case 3:
			obj_player.spit_damage *= 1.4;
		break;
		// Attack speed
		case 4:
			obj_player.spit_cooldown *= .8;
		break;
	
		// Tongue
		// Range
		case 5:
			obj_player.tongue_range *= 1.15;
		break;
		// Damage
		case 6:
			obj_player.tongue_damage *= 1.25;
		break;
		// Pierce
		case 7:
			obj_player.tongue_punch_through++;
		break;
		// Attack Speed
		case 8:
			obj_player.tongue_cooldown *= .9;
		break;
	}
}