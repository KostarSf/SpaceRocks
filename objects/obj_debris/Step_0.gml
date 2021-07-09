if (!global.gamePaused) {
	speed = move_speed;
	image_angle = direction;
	
	image_alpha -= fade_speed;

	if (image_alpha <= 0) {
		instance_destroy();
	}

	speed = speed / 1.02;
} else {
	speed = 0;
}