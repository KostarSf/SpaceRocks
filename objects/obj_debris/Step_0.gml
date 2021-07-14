if (!global.gamePaused) {
	x += -global.ship_hspeed / global.ship_moving_mult;
	y += -global.ship_vspeed / global.ship_moving_mult;
	
	//if (move_speed < 0.1) {
	//	instance_destroy();
	//}
	
	speed = move_speed;
	image_angle = direction;
	
	image_alpha -= fade_speed;

	if (image_alpha <= 0) {
		instance_destroy();
	}

	move_speed = speed / (1 + speed_decrease);
} else {
	speed = 0;
}