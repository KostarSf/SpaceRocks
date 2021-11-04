if (_ignore_asteros) exit;

var ship_to_astero_dir = point_direction(x, y, other.x, other.y);
var astero_to_ship_dir = point_direction(other.x, other.y, x, y);

var ship_speed = speed;
var astero_speed = other.speed;

other.take_damage(speed * 1.4);
if (other.is_alive) {
	with (other) {
		motion_add(ship_to_astero_dir, ship_speed);
	}
	motion_add(astero_to_ship_dir, astero_speed);
}

if (current_behavior == behavior_state.hit) {
	take_damage(speed * 10);
} else {
	take_damage(speed * 1.4);
}



var distance_to_astero = point_distance(x, y, other.x, other.y);
var direction_to_astero = point_direction(x, y, other.x, other.y);

var part_x = x + lengthdir_x(distance_to_astero / 2, direction_to_astero);
var part_y = y + lengthdir_y(distance_to_astero / 2, direction_to_astero);

create_particles(part_x, part_y, irandom_range(1, 3));
