_mouse_pressed = false;

if (menu_parent != undefined) {
	menu_parent.item_clicked(local_id);
} else {
	instance_destroy();
}