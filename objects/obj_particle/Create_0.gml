direction = irandom_range(0, 359);
image_angle = direction;
image_speed = random_range(1, 3);
move_speed = random_range(0.9, 1.1);
speed = move_speed;

fade_speed = 0.01;
speed_decrease = 0.01;

_can_collide = true;

function set_move_speed(speed) {
	move_speed = speed * random_range(0.9, 1.1);
}

depending_move = function(hmove, vmove) {
	x -= hmove;
	y -= vmove;
}
