// --- INFINITE SCALING LOGIC ---

// 1. Basic Tadpoles: Start with 2-4, add 1 every wave
var tadpole_count = irandom_range(2, 4) + current_wave;
scr_spawning(tadpole_count, obj_enemy_tadpole);

// 2. Fly: Has only a 20% chance of spawning, but if no fly has spawned the past two waves,
// it will spawn the third wave
var fly_chance = irandom_range(1, 5)
var spawn_fly = false

if (fly_chance == 5) {
	spawn_fly = true
} else {
	fly_pity += 1	
}

if (fly_pity >= 3) {
	spawn_fly = true
}

if (spawn_fly) {
	scr_spawning(1, obj_enemy_fly)
	fly_pity = 0
}

// 3. Tadpoles with Legs: Start appearing at Wave 2 (index 1)
if (current_wave >= 1) {
    var leg_count = current_wave // 1 on wave 2, 2 on wave 3, etc.
    scr_spawning(leg_count, obj_enemy_tadpole_legs)
}

// 34 Fish: Start appearing at Wave 3 (index 2)
if (current_wave >= 2) {
    var fish_count = floor(current_wave / 2) // Adds 1 fish every 2 waves
    scr_spawning(fish_count, obj_enemy_fish)
}

// 5. Flowers (Turrets): Start appearing at Wave 5 (index 4)
if (current_wave >= 4) {
    var flower_count = floor(current_wave / 4) // Adds 1 flower every 4 waves
    scr_spawning(flower_count, obj_enemy_flower)
}

//6. Frogs: Start appearing at Wave 10 
if (current_wave >= 10) {
	var frog_count = 1 + floor(current_wave / 3) // Adds 4 frogs at first, then 1 more every 3 waves
	scr_spawning(frog_count, obj_enemy_frog)
}