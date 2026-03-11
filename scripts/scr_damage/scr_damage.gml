// This script will inflict the passed damage to the target object
function inflict_damage(target, damage) {
	// Check if the iframes cooldown is below zero before damaging the target
	if (other.iframes_cooldown <= 0) {
		// Each collision will reduce health of the object 
		target.hp -= damage
	
		// Give the target iframes again by restarted the iframes cooldown
		other.iframes_cooldown = other.iframes_max_cooldown
	
		// If the target's health is below 0, destroy the target
		if (target.hp <= 0) {
			with (target) instance_destroy();
		}
	
	}
}