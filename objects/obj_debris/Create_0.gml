direction = irandom_range(0, 359);
image_angle = direction;
image_speed = random_range(1, 3);
move_speed = random_range(0.9, 1.1);
speed = move_speed;

fade_speed = 0.01;

skip_objects = true;

function set_move_speed(speed) {
	move_speed = speed * random_range(0.9, 1.1);
}

alarm[0] = 0.2 * room_speed;