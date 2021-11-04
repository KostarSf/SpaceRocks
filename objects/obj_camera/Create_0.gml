global.camera = self;

// Camera target
target = undefined;

// Camera
width = 640;
height = 480;

// Display
default_display_scale = 1.6;
display_width = width * default_display_scale;
display_height = height * default_display_scale;

window_set_size(display_width, display_height);
surface_resize(application_surface, display_width, display_height);
display_set_gui_size(global.gui_width, global.gui_height);


// private variables
_resizing_viewport = false;


// center the window
alarm[0] = 1;




// functions
get_width = function() {
	return width * scale;
}

get_height = function() {
	return height * scale;
}

get_center_x = function() {
	return camera_x + get_width() / 2;
}

get_center_y = function() {
	return camera_y + get_height() / 2;
}

set_center_x = function(x) {
	var new_x = x - get_width() / 2;
	camera_x = new_x;
}

set_center_y = function(y) {
	var new_y = y - get_height() / 2;
	camera_y = new_y;
}

set_target = function(target, instantly) {
	self.target = target;
	
	if (instantly) {
		set_center_x(target.x);
		set_center_y(target.y);
	}
}

set_shake = function(amount) {
	if (shake < amount) {
		shake = amount;
	}
}

add_shake = function(amount, max) {
	if (shake < max) {
		shake += amount;
	}
}

chasing_target = function() {
	var len = point_distance(get_center_x(), get_center_y(), target.x, target.y);
	var dir = point_direction(get_center_x(), get_center_y(), target.x, target.y);
	
	if (dir < 1) return;
	
	var add_x = lengthdir_x(len, dir) / camera_chase_speed_decrease;
	var add_y = lengthdir_y(len, dir) / camera_chase_speed_decrease;
	
	
	camera_x += add_x;
	camera_y += add_y;
}

count_pos_changing = function() {
	static old_x = 0;
	static old_y = 0;
	
	change_x = camera_x - old_x;
	change_y = camera_y - old_y;
	
	old_x = camera_x;
	old_y = camera_y;
}

set_scale = function(scl) {
	scale = scl;
}

camera_init_properties = function() {
	camera_id = 0;
	scale = 1;
	shake = 0;
	change_x = 0;
	change_y = 0;
	camera_chase_speed_decrease = 20;
	
	if (!is_undefined(target) && !instance_exists(target)) {
		target = undefined;
	}
	
	if (is_undefined(target)) {
		camera_x = 0;
		camera_y = 0;
	}


	view_enabled = true;
	view_visible[camera_id] = true;

	camera_set_view_size(view_camera[camera_id], width, height);
}

check_window_sizes = function() {
	// checks if dimensions are changed
	if (((display_width < global.window_width && display_height < global.window_height)
		|| (display_width > global.window_width && display_height > global.window_height))
		&& !_resizing_viewport) {
		alarm[1] = 10;
	}
}

draw_window_borders = function() {
	draw_outline(0, 0, global.gui_width - 1, global.gui_height - 1, 4, c_black);
	draw_outline(2, 2, global.gui_width - 3, global.gui_height - 3, 1, c_white);
	
}