if (!is_undefined(target)) {
	x -= target.hspeed * relative_speed;
	y -= target.vspeed * relative_speed;
}

if (!is_undefined(camera)) {
	x -= get_camera_update_pos(camera.change_x);
	y -= get_camera_update_pos(camera.change_y);
}


if (_star_is_fading) {
	image_alpha -= fade_speed;

	if (image_alpha <= 0) {
		instance_destroy();
	}
} else if (_star_is_persisting) {
	persist_duration -= 1;
	if (persist_duration <= 0) {
		_star_is_persisting = false;
		_star_is_fading = true;
	}
} else if (_star_is_rising) {
	image_alpha += rise_speed;
	if (image_alpha >= 1) {
		image_alpha = 1;
		_star_is_rising = false;
		_star_is_persisting = true;
	}
}

