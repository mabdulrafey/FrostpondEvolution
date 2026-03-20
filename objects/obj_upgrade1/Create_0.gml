global.game_state = game_states.paused;

if (obj_waves.level < 5) {
	chosen_upgrade = irandom(4);
} else {
	chosen_upgrade = irandom(8);
}

upgrade_messages = [
	// Player
	"max HP!",
	"movement speed!",
	// Spit
	"spit's damage!",
	"spit's projectile speed!",
	"spit's attack speed!",
	// Tongue
	"tongue's range!",
	"tongue's damage!",
	"tongue's pierce!",
	"tongue's attack speed!",
];