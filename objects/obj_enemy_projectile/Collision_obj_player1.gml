// When colliding with a player object, inflict 25 damage
inflict_damage(other, projectile_damage)

// Creates the particle system for visually displaying the player got hit
part_particles_create(global.particle_system, x, y, global.pt_enemy_particle, 15);

// Destroy the player spit
instance_destroy()