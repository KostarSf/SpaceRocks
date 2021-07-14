if (irandom_range(0, 15) == 0) {
	var _star_x = irandom_range(_start_x - 200, _start_x + 200);
	var _star_y = irandom_range(_start_y - 200, _start_y + 200);
	
	var _star_speed = random_range(0.5, 2);
	var _star_fade = random_range(0.001, 0.01);
	
	var _star_scale = random_range(0.7, 3.3);
	var _star_speed_decrease = 0;
	
	create_debris_ext_2(_star_x, _star_y, 1, 180, 1, _star_speed, _star_fade, _star_scale, _star_speed_decrease);
}

if (irandom_range(0, 10) == 0) {
	var _star_x = irandom_range(x - 70, x + 70);
	var _star_y = irandom_range(y - 30, y + 30);
	
	var _star_speed = random_range(3, 7);
	var _star_fade = random_range(0.01, 0.05);
	
	var _star_scale = random_range(0.7, 1.3);
	var _star_speed_decrease = 0.001;
	
	create_debris_ext_2(_star_x, _star_y, 1, 180, 1, _star_speed, _star_fade, _star_scale, _star_speed_decrease);
}

if (irandom_range(0, 5000) == 0 && !instance_exists(obj_menu_muffin)) {
	instance_create_layer(0, 0, "Instances", obj_menu_muffin);
}


function engine_fire_1() {
	if (irandom_range(0, 10) == 0) {
		var _star_x = x - 12 * ship_size;
		var _star_y = irandom_range(y + 2 * ship_size, y + 4 * ship_size);
	
		var _star_speed = random_range(2, 3);
		var _star_fade = random_range(0.001, 0.005);
	
		var _star_scale = ship_size;
		var _star_speed_decrease = 0.02;
	
		create_debris_ext_2(_star_x, _star_y, 1, 180, 3, _star_speed, _star_fade, _star_scale, _star_speed_decrease);
	}
}

function engine_fire_2() {
	if (irandom_range(0, 1) == 0) {
		var _star_x = x - 12 * ship_size;
		var _star_y = irandom_range(y + 2 * ship_size, y + 4 * ship_size);
	
		var _star_speed = random_range(4, 6);
		var _star_fade = random_range(0.001, 0.005);
	
		var _star_scale = ship_size;
		var _star_speed_decrease = 0.02;
	
		create_debris_ext_2(_star_x, _star_y, 1, 180, 3, _star_speed, _star_fade, _star_scale, _star_speed_decrease);
	}
}


switch (_stage) {
	case 0:
		var _dist = point_distance(x, y, _start_x, _start_y);
	
		if (x < -100) {
			x += 1;
		} else {
			x += (_dist - 4) / 30;
		}
	
		if (_dist < 5) _stage = 1;
		
		engine_fire_1();
		break;
	case 1:
		if (global.step_timer % 30 == 0) {
			_new_x = _start_x + irandom_range(-5, 5);
			_new_y = _start_y + irandom_range(-2, 2);
		}

		if (global.step_timer % 10 == 0) {
			_random_fire_subimg = irandom_range(0, 2);
			_random_fire_opacity = random_range(0.4, 1);
	
			if (x <= _new_x) x += 1;
			else x -= 1;
	
			if (y <= _new_y) y += 1;
			else y -= 1;
		}
		
		engine_fire_1();
		break;
	case 2:
		if (x < -32) x = -32;
	
		if (speed < 1) {
			speed += 0.02;
		} else {
			speed *= 1.05;
		}
	
		engine_fire_2();
		break;
}