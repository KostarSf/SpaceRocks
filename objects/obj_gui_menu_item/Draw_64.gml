draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var txt_x = _gui_x / obj_camera.camera_scale + sprite_width / 2;
var txt_y = _gui_y / obj_camera.camera_scale + sprite_height / 2;

if (!item_disabled) {
	if (_mouse_over) {
		if (_mouse_pressed) {
			draw_sprite(spr_gui_menu_item, 2, _gui_x, _gui_y);
		} else {
			draw_sprite(spr_gui_menu_item, 1, _gui_x, _gui_y);
		}
	
		draw_set_color(c_black);
		draw_text(txt_x, txt_y - 2, title);
		draw_set_color(c_yellow);
		draw_text(txt_x, txt_y, title);
	} else {
		draw_set_color(c_dkgray);
		draw_text(txt_x, txt_y, title);
		draw_set_color(c_white);
		draw_text(txt_x, txt_y - 2, title);
	}
} else {
	draw_set_color(c_black);
	draw_text(txt_x, txt_y - 2, title);
	draw_set_color(c_dkgray);
	draw_text(txt_x, txt_y, title);
}

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);