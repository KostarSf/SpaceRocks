if (_can_collide) {
	_can_collide = false;
	alarm[0] = room_speed * 0.2;
} else {
	exit;
}

direction = point_direction(other.x, other.y, x, y);
move_speed /= 1.5;