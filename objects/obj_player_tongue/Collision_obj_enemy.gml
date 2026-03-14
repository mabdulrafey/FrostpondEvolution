// When colliding with an enemy object, inflict 25 damage
inflict_damage(other, tongue_damage)
      
// Reduce punch through by one when colliding with an enemy
tongue_punch_through -= 1

// If punch through falls to zero or below, retract the tongue
if (tongue_punch_through <= 0) {
	state = "retracting"
}
