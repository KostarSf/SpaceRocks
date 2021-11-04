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


if (_picked_up) {
	image_xscale -= 0.1;
	image_yscale -= 0.1;
	
	if (image_xscale <= 0) {
		instance_destroy();
	}
}

image_angle += _rotate_speed;

if (global.steps % 30 == 0) {
	if (instance_exists(obj_player)) {
		var _dist = point_distance(x, y, obj_player.x, obj_player.y);
		if (_dist > 4000) instance_destroy();
	}
}