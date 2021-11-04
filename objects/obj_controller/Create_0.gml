// Globals
global.game_version = "v1.1.0 DEV";

global.window_width = 640;
global.window_height = 480;

global.gui_width = 640;
global.gui_height = 480;

global.camera = undefined;

global.current_window_transition = undefined;

global.mouse_moved = false;

global.steps = 0;

global.dev_gui_visible = false;

enum factions {
	none,
	neutral,
	ally,
	enemy
}

// Setups
draw_set_font(fnt_text);

window_set_cursor(cr_none);

alarm[0] = room_speed * 0.5;

// Private variables

_first_start = true;

// Functions

get_window_dimensions = function() {
	global.window_width = window_get_width();
	global.window_height = window_get_height();
}

check_mouse_for_moving = function() {
	static _tmp_mx = 0;
	static _tmp_my = 0;
	
	global.mouse_moved = point_distance(_tmp_mx, _tmp_my, window_mouse_get_x(), window_mouse_get_y()) > 0 ? true : false;
	_tmp_mx = window_mouse_get_x();
	_tmp_my = window_mouse_get_y();
}

check_dev_gui_switch_key = function() {
	// '~' key
	if (keyboard_check_pressed(192)) {
		global.dev_gui_visible = !global.dev_gui_visible;
	}
}

simple_controll_keys = function() {
	if (room == rm_stage_1 && keyboard_check_pressed(ord("R"))) {
		room_goto(rm_stage_1_intro);
	}
}

