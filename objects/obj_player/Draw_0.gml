// Turning on the shader
shader_set(shd_damage_flash)

// Getting the uniform variable and putting the value into the shader
var uniform = shader_get_uniform(shd_damage_flash, "damage_flash")
shader_set_uniform_f(uniform, damage_flash)

draw_self()
shader_reset()


var hp_percentage = (hp / max_hp) * 100

// Drawing the health bar from point (x1, y1) to (x2, y2) as a rectangle.
draw_healthbar(x - 20, y + 15, x + 20, y + 21, hp_percentage, c_black, c_red, c_green, 0, true, true)

