draw_sprite_ext(spr_ship, 0, x, y + 3, 0.94, 0.94, image_angle, c_dkgrey, image_alpha);
draw_self();

if (speed > 0.7) {
	draw_sprite_ext(spr_ship_accel, _anim_accell_frame, x, y, 1, 1, image_angle, c_white, image_alpha);
	if (global.steps % 20 == 0) {
		_anim_accell_frame += 1;
	}
}