draw_sprite(spr_upgrade, 0, x-(sprite_width/2), y-(sprite_height/2));

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_transformed(x, y - 10, "Upgrade your", .5, .5, 0);
draw_text_transformed(x, y - 10 + string_height("test")/2, upgrade_messages[chosen_upgrade], .5, .5, 0);

draw_text_transformed(x, y + 55, "Press 2", .5, .5, 0);