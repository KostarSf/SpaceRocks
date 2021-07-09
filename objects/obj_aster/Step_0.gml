if (!global.gamePaused) {
	speed = move_speed;
	image_angle += rotate_direction * rotate_speed;
} else {
	speed = 0;
}


move_wrap(true, true, sprite_width / 2);