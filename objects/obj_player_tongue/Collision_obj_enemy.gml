// Hurt the enemy
inflict_damage(other, tongue_damage);
      
// Use the Variable Definition value
tongue_punch_through -= 1;

// Retract if we've hit our limit
if (tongue_punch_through <= 0) {
    state = "retracting"; 
}