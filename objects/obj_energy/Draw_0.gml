draw_sprite_ext(sprite_index, image_index, x, y + 3, 0.94, 0.94, image_angle, c_dkgrey, image_alpha);

draw_self();

draw_sprite_ext(spr_glare_1, 0, x, y, 2, 1, _gl1_r, c_white, random_range(0.4, 1));
draw_sprite_ext(spr_glare_1, 0, x, y, 2, 1, _gl2_r, c_white, random_range(0.4, 1));
