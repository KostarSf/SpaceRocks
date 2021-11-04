speed = move_speed;
image_angle = direction;
	
image_alpha -= fade_speed;

if (image_alpha <= 0) {
	instance_destroy();
}

move_speed = speed / (1 + speed_decrease);