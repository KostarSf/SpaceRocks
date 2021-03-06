/// @description Create menu items

var i = array_length(menu_item_titles);
var item_margin = 42 * obj_camera.camera_scale;

repeat (i) {
	i -= 1;
	
	var itm = instance_create_layer(
		(x + 23) * obj_camera.camera_scale, 
		(y + 26) * obj_camera.camera_scale + i * item_margin, "GUI", obj_gui_menu_item);
	itm.title = menu_item_titles[i];
	itm.local_id = i;
	itm.menu_parent = id;
	
	menu_item_ids[i] = itm;
}