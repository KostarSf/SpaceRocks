if (!global.gamePaused) {
	speed = move_speed;
	
	if (irandom_range(0, 10) == 0) {
		create_debris_ext(x, y, 1, image_angle, 4, move_speed / 2, 0.02);
	}
} else {
	speed = 0;
}