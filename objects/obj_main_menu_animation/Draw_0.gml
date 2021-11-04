draw_sprite_ext(spr_ship_side, 0, x, y + 3, ship_size * 0.94, ship_size * 0.94, image_angle, c_dkgrey, image_alpha);

draw_self();

draw_sprite_ext(spr_ship_side_fire, _random_fire_subimg, 
	x, y, ship_size, ship_size, ship_rotate, c_white, _random_fire_opacity);