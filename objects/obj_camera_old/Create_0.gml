// Camera

camera_width = 512;
camera_height = 512;

_camera_ship_offset_x = 0;
_camera_ship_offset_y = 0;

_camera_chase_target = false;

// Display
default_display_scale = 1.6;
display_width = camera_width * default_display_scale;
display_height = camera_height * default_display_scale;

window_set_size(display_width, display_height);
surface_resize(application_surface, display_width, display_height)

_resize_in_progress = false;

alarm[0] = 1;