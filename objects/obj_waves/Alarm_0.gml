// --- INFINITE SCALING LOGIC ---

// 1. Basic Tadpoles: Start with 3, add 1 every wave
var tadpole_count = 3 + current_wave;
scr_spawning(tadpole_count, obj_enemy_tadpole, x, x + sprite_width, y, y + sprite_height);

// 2. Tadpoles with Legs: Start appearing at Wave 2 (index 1)
if (current_wave >= 1) {
    var leg_count = current_wave; // 1 on wave 2, 2 on wave 3, etc.
    scr_spawning(leg_count, obj_enemy_tadpole_legs, x, x + sprite_width, y, y + sprite_height);
}

// 3. Fish: Start appearing at Wave 3 (index 2)
if (current_wave >= 2) {
    var fish_count = floor(current_wave / 2); // Adds 1 fish every 2 waves
    scr_spawning(fish_count, obj_enemy_fish, x, x + sprite_width, y, y + sprite_height);
}

// 4. Flowers (Turrets): Start appearing at Wave 5 (index 4)
if (current_wave >= 4) {
    var flower_count = floor(current_wave / 4); // Adds 1 flower every 4 waves
    scr_spawning(flower_count, obj_enemy_flower, x, x + sprite_width, y, y + sprite_height);
}

current_wave++;