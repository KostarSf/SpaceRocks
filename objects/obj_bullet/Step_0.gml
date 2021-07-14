if (!global.gamePaused) {
	//x += -global.ship_hspeed / global.ship_moving_mult;
	//y += -global.ship_vspeed / global.ship_moving_mult;
	
	var _speed_mult = 0;
	if (instance_exists(obj_ship)) {
		_speed_mult = obj_ship.speed / 1.6;
	}
	
	speed = move_speed - _speed_mult;
	
	if (irandom_range(0, 10) == 0) {
		create_debris_ext(x, y, 1, image_angle, 4, move_speed / 2, 0.02);
	}
	
	image_alpha -= 0.002;
	
	if (image_alpha <= 0) {
		repeat (irandom_range(2, 5)) {
			create_debris_ext(x, y, 1, image_angle, 2, random_range(move_speed / 2, move_speed * 1.2), 0.01);
		}
		instance_destroy();
	} else if (image_alpha < 0.3) {
		if (irandom_range(0, linear_interpolate_value(image_alpha, 0, 0.3, 1, 7)) == 0) {
			create_debris_ext(x, y, 1, image_angle, 10, random_range(move_speed / 1.5, move_speed * 1.05), 0.03);
		}
	}
} else {
	speed = 0;
}