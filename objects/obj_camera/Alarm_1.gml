/// @description Resize canvas

var _smallest_side = 0;
if (window_get_width() > window_get_height()) {
	_smallest_side = window_get_height();
} else {
	_smallest_side = window_get_width();
}
	
if (_smallest_side < 10) {
	_resize_in_progress = false;
	exit;
}
	
display_width = _smallest_side;
display_height = _smallest_side;
	
surface_resize(application_surface, display_width, display_height);

// GUI
display_set_gui_size(camera_width / camera_scale, camera_height / camera_scale);

_resize_in_progress = false;