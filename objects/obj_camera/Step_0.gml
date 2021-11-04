/// @description Camera Behaviour

check_window_sizes();

if (!is_undefined(target)) {
	chasing_target();
}

count_pos_changing();

var _shake_x = random_range(-shake, shake);
var _shake_y = random_range(-shake, shake);

if (shake > 0) shake -= 0.1;
else shake = 0;

camera_set_view_pos(view_camera[camera_id], camera_x + _shake_x, camera_y + _shake_y);
camera_set_view_size(view_camera[camera_id], get_width(), get_height());