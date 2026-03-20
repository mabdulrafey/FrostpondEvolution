// Turning on the shader
shader_set(shd_damage_flash)

// Getting the uniform variable and putting the value into the shader
var uniform = shader_get_uniform(shd_damage_flash, "damage_flash")
shader_set_uniform_f(uniform, damage_flash)

draw_self()
shader_reset()