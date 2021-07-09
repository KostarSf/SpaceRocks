can_be_unspawn = false;

rotate_direction = choose(1, -1);
rotate_speed = random_range(0.1, 1.5);

move_speed = random_range(0.4, 1.3);

mass = 1.5;

sprite_index = choose(
	spr_aster_small, spr_aster_med,
	spr_aster_large
);

switch (sprite_index) {
	case spr_aster_med:
		mass = 2.5;
		break;

	case spr_aster_large:
		mass = 4;
		break;
}

direction = irandom_range(0, 359);
image_angle = irandom_range(0, 359);

speed = move_speed;

image_alpha = 0.8;

alarm[0] = 4 * room_speed;
