if (global.steps % 10 == 0) {
	create_particles(x, y, 2);
}

if (speed > desired_speed) {
	speed *= 0.99;
}

_gl1_r += _glares_rotate_speed;
_gl2_r -= _glares_rotate_speed;