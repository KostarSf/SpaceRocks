if (is_undefined(target)
	|| !instance_exists(target)) {
	image_alpha = 0;
	exit;
} else {
	image_alpha = 1;

	x = target.x;
	y = target.y - 32;
}