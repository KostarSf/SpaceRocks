var _self_dir = point_direction(other.x, other.y, x, y);
var _dist = point_direction(other.x, other.y, x, y);
//var _stren = ((sprite_width / 2 - 2) - _dist) / 800;
//if (_stren < 0) _stren *= -1;
var _stren = 0.15;

with (other) {
	if (can_be_vacuumed()) {
		vacuum_on();
		motion_add(_self_dir, _stren);
	}
}