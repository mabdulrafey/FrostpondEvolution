// This script will inflict the passed damage to the target object
function inflict_damage(target, damage){
	// Each collision will reduce health of the object 
	target.hp -= damage
	
	// If the target's health is below 0, destroy the target
	if (target.hp <= 0) {
		with (target) instance_destroy();
	}
}