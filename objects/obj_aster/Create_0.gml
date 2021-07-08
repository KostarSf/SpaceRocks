rotate_direction = choose(1, -1);
rotate_speed = random_range(0.1, 1.5);

sprite_index = choose(
	spr_aster_small, spr_aster_med, 
	spr_aster_large
);

direction = irandom_range(0, 359);
image_angle = irandom_range(0, 359);

speed = random_range(0.4, 1.3);