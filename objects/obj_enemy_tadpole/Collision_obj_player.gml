// Check if the iframes cooldown is below zero before damaging the player
if (other.iframes_cooldown <= 0) {

	// Colliding with the player will damage them with the passed amount
	inflict_damage(other, damage)

	// Give the player iframes again by restarted the iframes cooldown
	other.iframes_cooldown = other.iframes_max_cooldown
}