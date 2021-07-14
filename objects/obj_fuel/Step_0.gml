if (!_under_vacuum) {
	if (speed > 1) {
		speed -= speed / 30;
	} else if (speed > 0.1) {
		_can_be_vacuumed = true;
		speed -= 0.02;
	} else {
		speed = 0.1;
	}
}


x += -global.ship_hspeed /*/ global.ship_moving_mult*/;
y += -global.ship_vspeed /*/ global.ship_moving_mult*/;


if (_picked_up) {
	image_xscale -= 0.1;
	image_yscale -= 0.1;
	
	if (image_xscale <= 0) {
		instance_destroy();
	}
}

image_angle += _rotate_speed;

if (global.step_timer % 30 == 0) {
	if (instance_exists(obj_ship)) {
		var _dist = point_distance(x, y, obj_ship.x, obj_ship.y);
		if (_dist > 4000) instance_destroy();
	}
}