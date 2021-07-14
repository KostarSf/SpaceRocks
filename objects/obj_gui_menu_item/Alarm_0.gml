/// @description correct self location

_gui_x = x;
_gui_y = y;

x += obj_camera.camera_x;
y += obj_camera.camera_y;

image_xscale *= obj_camera.camera_scale;
image_yscale *= obj_camera.camera_scale;