create_star_dust(180, 0.005);

draw_bg_stars();

draw_speed_dust();

if (irandom_range(0, 5000) == 0 && !instance_exists(obj_main_menu_muffin)) {
	instance_create_layer(0, 0, "Instances", obj_main_menu_muffin);
}

switch (_stage) {
	case 0:
		var _dist = point_distance(x, y, _start_x, _start_y);
	
		if (x > _start_x) x = -150;
	
		if (x < -100) {
			x += 1;
		} else {
			x += (_dist - 4) / 30;
		}
	
		if (_dist < 5) _stage = 1;
		
		if (global.steps % 30 == 0) {
			_new_y = _start_y + irandom_range(-2, 2);
		}

		if (global.steps % 10 == 0) {
			_random_fire_subimg = irandom_range(0, 2);
			_random_fire_opacity = random_range(0.4, 1);
	
			if (y <= _new_y) y += 1;
			else y -= 1;
		}
		
		engine_fire_1();
		break;
	case 1:
		if (global.steps % 30 == 0) {
			_new_x = _start_x + irandom_range(-5, 5);
			_new_y = _start_y + irandom_range(-2, 2);
		}

		if (global.steps % 10 == 0) {
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
		
		if (x > room_width * 2) speed = 0;
		
		if (global.steps % 10 == 0) {
			_new_y = _start_y + irandom_range(-2, 2);
		}

		if (global.steps % 4 == 0) {
			_random_fire_subimg = irandom_range(0, 2);
			_random_fire_opacity = random_range(0.4, 1);
	
			if (y <= _new_y) y += 1;
			else y -= 1;
		}
	
		engine_fire_2();
		break;
}