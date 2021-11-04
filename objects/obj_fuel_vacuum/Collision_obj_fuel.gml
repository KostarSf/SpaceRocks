var _self_dir = point_direction(other.x, other.y, x, y);
var _stren = 0.15;

with (other) {
	if (obj_player._lives == 0) exit;
	if (can_be_vacuumed()) {
		vacuum_on();
		motion_add(_self_dir, _stren + vacuum_multiply);
		vacuum_multiply_increase();
	}
}