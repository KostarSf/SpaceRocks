/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

if (second_life) {
	draw_sprite_ext(spr_ship, -1, x, y, 1, 1, image_angle, c_white, ship_opacity);
} else {
	draw_sprite_ext(spr_ship_damaged, -1, x, y, 1, 1, image_angle, c_white, ship_opacity);
}

if (accelerating) {
	draw_sprite_ext(spr_ship_accel, anim_accell_frame, x, y, 1, 1, image_angle, c_white, ship_opacity);
	if (anim_step % anim_accell_speed == 0) {
		anim_accell_frame += 1;
	}
	if (anim_accell_frame > 127) {
		anim_accell_frame = 0;
	}
}

if (charging) {
	draw_sprite_ext(spr_charge, anim_charge_frame, x, y, 1, 1, image_angle, c_white, ship_opacity);
	if (anim_step % anim_charge_speed == 0) {
		anim_charge_frame += 1;
		//repeat (irandom_range(0, 4)) {
		//	instance_create_layer(x, y, "Instances", obj_debris);
		//}
		obj_game.create_debris(x, y, irandom_range(0, 4));
	}
	if (anim_charge_frame > 127) {
		anim_charge_frame = 0;
	}
}