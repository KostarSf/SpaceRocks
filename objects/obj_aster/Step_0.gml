speed = move_speed;
image_angle += rotate_direction * rotate_speed;

if (x < -1450 || x > room_width + 1450 || y < - 1450 || y > room_height + 1450) {
	if (irandom_range(0, 20) == 0) {
		_astero_destroy(false, false);
	}
}

move_wrap(true, true, 1500);