/// @description Camera Setup

// Camera
camera_id = 0;

camera_x = 0;
camera_y = 0;
target = obj_ship;

if (room == rm_game) {
	camera_x = target.x - camera_width * camera_scale / 2;
	camera_y = target.y - camera_height * camera_scale / 2;
}

camera_scale = 1;

_camera_chase_target = false;

view_enabled = true;
view_visible[camera_id] = true;

camera_set_view_size(view_camera[camera_id], camera_width, camera_height);
