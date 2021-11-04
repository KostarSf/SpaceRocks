distance_multiply = 30;


// Private variables

_ship_x = x;
_ship_y = y;
_ship_dir = 0;
_ship_spd = 0;

_ship_point_x = x;
_ship_point_y = y;

_mouse_dir = 0;
_mouse_dist = 0;

_mouse_point_x = x;
_mouse_point_y = y;

// Functions

update_position = function() {
	var _ship_point_length_x = lengthdir_x(_ship_spd * distance_multiply, _ship_dir);
	var _ship_point_length_y = lengthdir_y(_ship_spd * distance_multiply, _ship_dir);
	
	var _mouse_point_length_x = lengthdir_x(_mouse_dist / 4, _mouse_dir);
	var _mouse_point_length_y = lengthdir_y(_mouse_dist / 4, _mouse_dir);
	
	_ship_point_x = _ship_x + _ship_point_length_x;
	_ship_point_y = _ship_y + _ship_point_length_y;
	
	_mouse_point_x = _ship_x + _mouse_point_length_x;
	_mouse_point_y = _ship_y + _mouse_point_length_y;
	
	var _vc_dist = point_distance(_ship_point_x, _ship_point_y, _mouse_point_x, _mouse_point_y);
	var _vc_dir = point_direction(_mouse_point_x, _mouse_point_y, _ship_point_x, _ship_point_y);
	
	if (_ship_spd <= 1) {
		var _div = lin_int(_ship_spd, 0, 1, 8, 1.5);
		
		x = _mouse_point_x + lengthdir_x(_vc_dist / _div, _vc_dir);
		y = _mouse_point_y + lengthdir_y(_vc_dist / _div, _vc_dir);
	} else {
		x = _mouse_point_x + lengthdir_x(_vc_dist / 1.5, _vc_dir);
		y = _mouse_point_y + lengthdir_y(_vc_dist / 1.5, _vc_dir);
	}
}

ship_properties = function(x, y, dir, spd) {
	_ship_x = x;
	_ship_y = y;
	_ship_dir = dir;
	_ship_spd = clamp(spd, 0, 6);
}

mouse_properties = function(dir, dist, mouse_control) {
	if (mouse_control) {
		if (dist > 400) dist = 400;
		if (dist < 32) dist = 0;
	
		_mouse_dir = dir;
		_mouse_dist = dist;
	} else {
		_mouse_dir = 0;
		_mouse_dist = 0;
	}
	
}