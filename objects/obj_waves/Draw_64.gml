// 1. Set the look of the text
draw_set_halign(fa_left); // Align to the left side
draw_set_valign(fa_top);  // Align to the top
draw_set_color(c_black);  // Black shadow for readability
draw_text(22, 22, "LEVEL: " + string(level));
draw_text(22, 62, "WAVE: " + string(current_wave + 1));

draw_set_color(c_white);  // Main white text
draw_text(20, 20, "LEVEL: " + string(level));
draw_text(20, 60, "WAVE: " + string(current_wave + 1));