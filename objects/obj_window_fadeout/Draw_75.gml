draw_set_color(c_black);
var _mar = 4;
var _cur_str = 0;
var _str_height = (room_height - _mar * 2) / _stripe_count;
repeat (_stripe_count) {
	draw_rectangle(_mar, _mar + (_cur_str * _str_height), (room_width - _mar*2) / 100 * _anim_step + _mar, _mar + (_cur_str * _str_height) + _str_height / 2, false);
	draw_rectangle(room_width - _mar * 2 - (room_width - _mar*2) / 100 * _anim_step + _mar, _mar + (_cur_str * _str_height) + _str_height / 2, room_width - _mar, _mar + (_cur_str * _str_height) + _str_height, false);
	_cur_str += 1;
}