draw_sprite_ext(sprite_index, image_index, x, y + 2, 0.94, 0.94, image_angle, c_dkgrey, image_alpha);

draw_sprite_ext(spr_glare_1, 0, x, y, point_distance(x, y, spawn_x, spawn_y) / 300, 0.6, 0, c_white, random_range(0.4, 1));
draw_self();