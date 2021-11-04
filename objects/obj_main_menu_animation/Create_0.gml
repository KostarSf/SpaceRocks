x = -150;
y = room_height / 1.6;

ship_size = 2;
ship_rotate = 0;

image_angle = ship_rotate;

image_xscale = ship_size;
image_yscale = ship_size;


// Private variables

_start_x = room_width / 1.2;
_start_y = room_height / 1.6;

_new_x = 0;
_new_y = 0;

_random_fire_subimg = 0;
_random_fire_opacity = 1;

_stage = 0;



// Functions

start_stage_2 = function() {
	_stage = 2;
}

start_stage_0 = function() {
	speed = 0;
	_stage = 0;
}

draw_bg_stars = function() {
	if (irandom_range(0, 5) == 0) {
		var _star_x = irandom_range(_start_x - 200, _start_x + 200);
		var _star_y = irandom_range(_start_y - 200, _start_y + 200);
	
		var _star_scale = random_range(0.1, 1.5);
		
		var _star = create_bg_star(_star_x, _star_y, undefined, global.camera);
		_star.set_scale(_star_scale);
		_star.static_direction = 180;
		_star.static_speed = 1.5;
	}
}

draw_speed_dust = function() {
	if (irandom_range(0, 10) == 0) {
		var _star_x = irandom_range(x - 70, x + 70);
		var _star_y = irandom_range(y - 30, y + 30);
	
		var _star_speed = random_range(3, 7);
		var _star_fade = random_range(0.01, 0.05);
	
		var _star_scale = random_range(0.7, 1.3);
		var _star_speed_decrease = 0.001;
	
		create_particles_ext_2(_star_x, _star_y, 1, 180, 1, _star_speed, _star_fade, _star_scale, _star_speed_decrease);
	}
}

engine_fire_1 = function() {
	if (irandom_range(0, 10) == 0) {
		var _star_x = x - 12 * ship_size;
		var _star_y = irandom_range(y + 2 * ship_size, y + 4 * ship_size);
	
		var _star_speed = random_range(1, 3);
		var _star_fade = random_range(0.007, 0.015);
	
		var _star_scale = ship_size;
		var _star_speed_decrease = 0.02;
	
		create_particles_ext_2(_star_x, _star_y, 1, 180, 3, _star_speed, _star_fade, _star_scale, _star_speed_decrease);
	}
}

engine_fire_2 = function() {
	if (irandom_range(0, 1) == 0) {
		var _star_x = x - 12 * ship_size;
		var _star_y = irandom_range(y + 2 * ship_size, y + 4 * ship_size);
	
		var _star_speed = random_range(4, 6);
		var _star_fade = random_range(0.001, 0.005);
	
		var _star_scale = ship_size;
		var _star_speed_decrease = 0.02;
	
		create_particles_ext_2(_star_x, _star_y, 1, 180, 3, _star_speed, _star_fade, _star_scale, _star_speed_decrease);
	}
}