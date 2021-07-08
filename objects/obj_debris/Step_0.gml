image_alpha -= 0.01;

if (image_alpha <= 0) {
	instance_destroy();
}

speed = speed / 1.02;