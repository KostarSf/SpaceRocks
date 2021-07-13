image_alpha -= 0.016;
image_xscale += 0.2;
image_yscale = image_xscale;

if (image_alpha <= 0) {
	instance_destroy();
}