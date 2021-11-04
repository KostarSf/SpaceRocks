/* ____ Check inputs ____ */

var move_forward = keyboard_check(ord("W")) || keyboard_check(vk_up);
var move_forward_started = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);

var move_left = keyboard_check(ord("Q"));
var move_right = keyboard_check(ord("E"));

var rotate_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var rotate_right = keyboard_check(vk_right) || keyboard_check(ord("D"));

var primary_fire = keyboard_check(vk_space) || mouse_check_button(mb_left);
var primary_fire_pressed = keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left);

var secondary_fire = keyboard_check(vk_alt) || mouse_check_button(mb_right);
var secondary_fire_pressed = keyboard_check_pressed(vk_alt) || mouse_check_button_pressed(mb_right);

var speed_boost = keyboard_check(vk_shift);
var show_radar = keyboard_check(vk_tab);

_radar_button = show_radar;

_draw_engine_fire = is_alive() * move_forward;
_show_radar = false;

if (_lives == 1) {
	if (irandom_range(0, 7) == 0) {
		create_particles_ext_2(x, y, 1, 0, 359, 0.5, 0.02, 2, 0.01);
	}
}

if (is_alive() && has_fuel()) {
	if (show_radar) {
		_show_radar = energy_use(2);
	}
	
	
	/* ____ Check controls ____ */ 

	if (global.mouse_moved) {
		mouse_control = true;
		cursor_sprite = spr_cursor_crosshair;
	}

	if (rotate_right || rotate_left) {
		mouse_control = false;
		image_angle += (rotate_left - rotate_right) * 5;
		cursor_sprite = -1;
	}

	if (ship_to_cursor_distance() < 32) {
		mouse_control = false;
		cursor_sprite = -1;
	}

	if (mouse_control) {
		image_angle = ship_to_cursor_direction();
	}

	_ship_drifting = abs(angle_difference(image_angle, direction));
	
	/* ____ Update movings ____ */


	if (move_forward && speed_boost) {
		if (current_stage() == stage.st1 && _fuel < 1000) {
			speed_boost = false;
		} else {
			if (current_stage() == stage.st1) {
				speed_boost = fuel_use(lin_int(speed, 10, 50, 5, 30));
			} else {
				speed_boost = power_use(2, true);
			}
		}
		
	}

	if (move_forward) {
		if (current_stage() == stage.st1) {
			fuel_use(1);
		} else {
			power_use(0.5, true);
		}
		
		if (speed <= 1.2) {
			motion_add(image_angle, 0.12);
		} else {
			motion_add(image_angle, 0.04);
		}
	
		if (speed_boost) {
			motion_add(image_angle, 0.2);
		}
	
		if (_ship_drifting > 100) {
			motion_add(image_angle, lin_int(_ship_drifting, 100, 180, 0, 0.1));
		}
	
		// Shake camera
		accelerate_camera_shaking();
	} else {
		if (speed < 0.2) {
			speed *= 0.95;
		} else if (speed < 2) {
			speed *= 0.997;
		} else {
			speed *= 0.9999;
		}
	}

	if (!speed_boost) {
		if (speed > max_speed * 2) {
			speed -= (speed - max_speed) / 30;
		}
		else if (speed > max_speed) {
			 speed -= (speed - max_speed) / 3;
		}
	} else {
		if (speed > max_speed * 10) {
			speed -= (speed - max_speed) / 200;
		}
	}
	
	/* ____ Check fires ____ */
	
	if (primary_fire_pressed) {
		with (primary_slot) {
			event_user(0);
		}
	}

	if (primary_fire) {
		with (primary_slot) {
			event_user(1);
		}
	}

	if (secondary_fire_pressed) {
		with (secondary_slot) {
			event_user(0);
		}
	}

	if (secondary_fire) {
		with (secondary_slot) {
			event_user(1);
		}
	}
} else if (is_alive() && !has_fuel()) {
	cursor_sprite = -1;
	
	speed *= 0.995;
	
	if (speed < 0.5) {
		if (global.steps % (4 * room_speed) == 0) {
			alarm[1] = 1*room_speed;
			alarm[2] = 3*room_speed;
		}
	}
} else {
	if (speed > 0.1) {
		speed = speed * 0.975;
	}
	
}



/* ____ Other prefs ____ */


emit_debris();

update_is_shield_active();

spawn_speed_dust();

power_auto_charge();

correct_position();

update_camera_scale();

camera_target.ship_properties(x, y, direction, speed);
camera_target.mouse_properties(ship_to_cursor_direction(), ship_to_cursor_distance(), mouse_control);