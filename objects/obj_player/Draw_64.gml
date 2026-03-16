if (evolution_message != "") {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Choose color based on the text
    // If the word "WAVE" is in the message, make it White. Otherwise, keep it Yellow for Evolve.
    var text_color = c_yellow;
    if (string_pos("WAVE", evolution_message) != 0) {
        text_color = c_white;
    }

    // Draw Shadow
    draw_set_color(c_black);
    draw_text_transformed(display_get_gui_width() / 2 + 4, 154, evolution_message, 3, 3, 0);
    
    // Draw Main Text with the dynamic color
    draw_set_color(text_color);
    draw_text_transformed(display_get_gui_width() / 2, 150, evolution_message, 3, 3, 0);
    
    // Reset
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
}