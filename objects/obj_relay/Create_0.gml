var _dist = 20000;
var _dir = irandom(359);

x = lengthdir_x(_dist, _dir);
y = lengthdir_y(_dist, _dir);

obj_player.find_relay();

_visible_scale = 1;

_player_distance = 100000;

set_visible_scale = function(scale) {
	_visible_scale = scale * 1.2;
	image_xscale = scale * 2;
	image_yscale = scale * 2;
}

set_visible_scale(1);

sprite_scale = function() {
	return _visible_scale;
}

get_player_distance = function() {
	return _player_distance;
}

depending_move = function(hmove, vmove) {
	if (_player_distance > 800) {
		x -= hmove / 3;
		y -= vmove / 3;
	} else {
		set_visible_scale(lin_int(_player_distance, 50, 300, 3.5, 1));
		image_alpha = lin_int(_player_distance, 100, 800, 1, 0.05);
		var move_mult = lin_int(_player_distance, 0, 800, 0.0005, 0.3);
		
		x -= hmove * move_mult;
		y -= vmove * move_mult;
	}
}