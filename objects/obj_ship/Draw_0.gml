draw_sprite_ext(spr_ship, 0, x, y + 3, 0.94, 0.94, image_angle, c_dkgrey, ship_opacity);

if (second_life) {
	draw_sprite_ext(spr_ship, 0, x, y, 1, 1, image_angle, c_white, ship_opacity);
} else {
	draw_sprite_ext(spr_ship, 1, x, y, 1, 1, image_angle, c_white, ship_opacity);
}

if (accelerating) {
	draw_sprite_ext(spr_ship_accel, anim_accell_frame, x, y, 1, 1, image_angle, c_white, ship_opacity);
	if (global.step_timer % 10 == 0) {
		anim_accell_frame += 1;
	}
}

if (charging) {
	draw_sprite_ext(spr_charge, anim_charge_frame, x, y, 1, 1, image_angle, c_white, ship_opacity);
	if (global.step_timer % 10 == 0) {
		anim_charge_frame += 1;
	}
}