// 1. Set the look of the text
draw_set_halign(fa_left); // Align to the left side
draw_set_valign(fa_top);  // Align to the top
draw_set_color(c_black);  // Black shadow for readability
draw_text(22, 22, "SCORE: " + string(score_total));
draw_text(22, 42, "WAVE: " + string(current_wave + 1));

draw_set_color(c_white);  // Main white text
draw_text(20, 20, "SCORE: " + string(score_total));
draw_text(20, 40, "WAVE: " + string(current_wave + 1));