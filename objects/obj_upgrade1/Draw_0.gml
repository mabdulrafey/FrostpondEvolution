draw_sprite(spr_upgrade, 0, x-(sprite_width/2), y-(sprite_height/2));

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_colour(c_black);
draw_text_transformed(x + 1, y - 30, "Upgrade your", .5, .5, 0);
draw_text_transformed(x + 1, y - 30 + string_height("test")/2, upgrade_messages[chosen_upgrade], .5, .5, 0);
draw_text_transformed(x + 1, y + 43 , "1", 1.5, 1.5, 0);

draw_set_colour(c_white);
draw_text_transformed(x, y - 30, "Upgrade your", .5, .5, 0);
draw_text_transformed(x, y - 30 + string_height("test")/2, upgrade_messages[chosen_upgrade], .5, .5, 0);
draw_text_transformed(x, y + 43 , "1", 1.5, 1.5, 0);