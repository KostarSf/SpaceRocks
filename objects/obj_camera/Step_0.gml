switch (room) {
	case rm_game:
	case rm_start:
		if (irandom_range(0, 10) == 0) {
			var _dust_x = irandom_range(0, room_width);
			var _dust_y = irandom_range(0, room_height);
			
			var _dust_speed = random_range(0, 0.01);
			var _dust_size = random_range(0.5, 2.1);
			
			create_debris_ext_2(_dust_x, _dust_y, 1, 0, 360, _dust_speed, 0.004, _dust_size, 0.0001);
		}
		break;
}

if (display_width < window_get_width() && display_height < window_get_height()) {
	if (!_resize_in_progress) {
		_resize_in_progress = true;
		alarm[1] = 10;
	}
} else if (display_width > window_get_width() && display_height > window_get_height()) {
	if (!_resize_in_progress) {
		_resize_in_progress = true;
		alarm[1] = 10;
	}
}

if (!global.gamePaused && instance_exists(target)) {
	// create batches of fuel
	if (irandom_range(0, 600) == 0 && instance_number(obj_fuel_batch) < 10 && target.speed > 1) {
		instance_create_layer(0, 0, "Instances", obj_fuel_batch);
	}
	
	// camera
	var new_camera_scale = 1 + target.speed / 30;
	if (camera_scale != new_camera_scale) {
		camera_scale += (new_camera_scale - camera_scale) / 5;
	}
	
	var camera_smooth_mult = camera_height / 20;
	
	var rel_target_x = target.x - camera_width * camera_scale / 2;
	var rel_target_y = target.y - camera_height * camera_scale / 2;
	
	
	_camera_ship_offset_x += target.hspeed;
	_camera_ship_offset_y += target.vspeed;
	
	var _max_off_distance = camera_width / 3;
	
	if (global.ship_accelerating || (abs(_camera_ship_offset_x) > _max_off_distance
		|| abs(_camera_ship_offset_y) > _max_off_distance)) {
		_camera_chase_target = true;
	}
	
	
	
	if (!_camera_chase_target) {
		camera_x = camera_x - (camera_x - rel_target_x + _camera_ship_offset_x) / 50;
		camera_y = camera_y - (camera_y - rel_target_y + _camera_ship_offset_y) / 50;
	} else {
		_camera_ship_offset_x = 0;
		_camera_ship_offset_y = 0;
		
		camera_x = camera_x - (camera_x - rel_target_x - target.hspeed * camera_smooth_mult) / 30;
		camera_y = camera_y - (camera_y - rel_target_y - target.vspeed * camera_smooth_mult) / 30;
		
		if (target.speed < 1.1) {
			_camera_chase_target = false;
		}
	}
}

camera_set_view_pos(view_camera[camera_id], camera_x, camera_y);
camera_set_view_size(view_camera[camera_id], camera_width * camera_scale, camera_height * camera_scale);