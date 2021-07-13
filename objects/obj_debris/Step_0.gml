if (!global.gamePaused) {
	if (move_speed < 0.1) {
		instance_destroy();
	}
	
	speed = move_speed;
	image_angle = direction;
	
	image_alpha -= fade_speed;

	if (image_alpha <= 0) {
		instance_destroy();
	}

	move_speed = speed / 1.01;
} else {
	speed = 0;
}