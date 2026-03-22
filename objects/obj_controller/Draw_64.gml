// Added the check for upgrade objects here
if (global.game_state == game_states.paused && !instance_exists(obj_upgrade1)) {
    
    // Draw a dark transparent overlay
    draw_set_alpha(0.5);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    
    // Draw the "PAUSED" text
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Center it on the GUI layer
    draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() / 2, "PAUSED", 3, 3, 0);
    
    // Reset alignment so other text (like score or HP) isn't messed up
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}