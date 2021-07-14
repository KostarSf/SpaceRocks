draw_self();

if (speed > 0.7) {
	draw_sprite_ext(spr_ship_accel, _anim_accell_frame, x, y, 1, 1, image_angle, c_white, image_alpha);
	if (global.step_timer % 20 == 0) {
		_anim_accell_frame += 1;
	}
}