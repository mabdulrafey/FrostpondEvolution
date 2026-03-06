// Calculating the offset of the hop using sin, for a nice looking hop cycle
var hop_offset = abs(sin(hop_timer)) * hop_height

// This will draw the player higher depending on the hop-offset,
// creating the illusion that they are hopping
draw_sprite_ext(sprite_index, image_index, x, y - hop_offset, 1, 1, image_angle, c_white, 1)