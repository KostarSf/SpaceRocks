x = -300;
y = room_width / 1.6;

ship_size = 2;
ship_rotate = 0;

image_angle = ship_rotate;

image_xscale = ship_size;
image_yscale = ship_size;

_start_x = room_width / 1.2;
_start_y = room_width / 1.6;

_new_x = 0;
_new_y = 0;

_random_fire_subimg = 0;
_random_fire_opacity = 1;

_stage = 0;

start_stage_2 = function() {
	_stage = 2;
}