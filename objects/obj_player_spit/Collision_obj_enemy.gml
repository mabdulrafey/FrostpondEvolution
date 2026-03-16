// 1. Deal damage to the enemy we hit
// 'other' refers to the specific enemy instance the spit touched
other.hp -= spit_damage;

// 2. Check if the enemy's health has run out
if (other.hp <= 0) {
    // Add to score only when the enemy actually dies
    if (instance_exists(obj_waves)) {
        obj_waves.score_total += other.my_value;
    }
    
    // Destroy the enemy
    with(other) {
        instance_destroy();
    }
}

// 3. Destroy the spit projectile (since it hit something)
instance_destroy();