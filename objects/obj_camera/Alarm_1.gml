/// @description Resize viewport

var _smallest_side = 0;
if (global.window_width > global.window_height) {
	_smallest_side = global.window_height;
} else {
	_smallest_side = global.window_width;
}
	
if (_smallest_side < 10) {
	_resizing_viewport = false;
	exit;
}
	
display_width = global.window_width;
display_height = global.window_height;
	
surface_resize(application_surface, display_width, display_height);
display_set_gui_size(global.gui_width, global.gui_height);

_resizing_viewport = false;