// Calculating the offset of the hop using sin, for a nice looking up and down hop cycle
//var hop_offset = abs(sin(hop_timer)) * hop_height // Amplifying it with hop_height
// This will draw the player higher depending on the hop-offset,
// creating the illusion that they are hopping
//draw_sprite_ext(sprite_index, image_index, x, y - hop_offset, 1, 1, image_angle, c_white, 1)

draw_self()

var hp_percentage = (hp / max_hp) * 100

// Drawing the health bar from point (x1, y1) to (x2, y2) as a rectangle.
draw_healthbar(x - 20, y + 15, x + 20, y + 21, hp_percentage, c_black, c_red, c_green, 0, true, true)