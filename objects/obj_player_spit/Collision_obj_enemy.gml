// Use 'other' to grab the value from the specific enemy we hit
if (instance_exists(obj_waves)) {
    obj_waves.score_total += other.my_value;
}

// Destroy the spit
instance_destroy();

// Destroy the enemy
with(other) {
    instance_destroy();
}