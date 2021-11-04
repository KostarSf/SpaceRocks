if (_lives == 0) exit;

draw_sprite_ext(spr_ship, 0, x, y + 3, 0.94, 0.94, image_angle, c_dkgrey, image_alpha);
draw_self();

draw_engine_fire();
draw_radar();