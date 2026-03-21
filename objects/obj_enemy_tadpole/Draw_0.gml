// Calculating the hop offset using the ac_hop Animation Curve
var hop_offset = hop_curve_value * hop_height // Amplifying it with hop_height

// Turning on the shader
shader_set(shd_damage_flash)

// Getting the uniform variable and putting the value into the shader
var uniform = shader_get_uniform(shd_damage_flash, "damage_flash")
shader_set_uniform_f(uniform, damage_flash)

// This will draw the enemy hop higher depending on the hop-offset,
// creating the illusion that they are hopping
draw_sprite_ext(sprite_index, image_index, x, y - hop_offset, 1, 1, image_angle, c_white, 1)

shader_reset()

