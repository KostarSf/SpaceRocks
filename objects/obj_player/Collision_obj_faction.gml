if (other.faction == faction || _lives == 0) exit;

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


var distance_to_astero = point_distance(x, y, other.x, other.y);
var direction_to_astero = point_direction(x, y, other.x, other.y);

var part_x = x + lengthdir_x(distance_to_astero / 2, direction_to_astero);
var part_y = y + lengthdir_y(distance_to_astero / 2, direction_to_astero);

create_particles(part_x, part_y, irandom_range(1, 3));
add_emit_debris((astero_speed + ship_speed) * 3);
global.camera.add_shake(1.5, 4);

if (audio_is_playing(snd_scratch) == false) {
	audio_play_sound(snd_scratch, 20, false)
}


if (current_stage() == stage.st2) power_use((ship_speed + astero_speed) * 3, true);
else fuel_use(lin_int(ship_speed + astero_speed, 0, 10, 10, _fuel / 4));
if (ship_speed + astero_speed > 4) lives_decrease();