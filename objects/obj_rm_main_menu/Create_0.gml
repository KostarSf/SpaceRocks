stop_window_transition();

cursor_sprite = spr_cursor;

instance_create_layer(0, 0, "Instances", obj_main_menu_animation);

show_start_button = false;
start_button_opacity = 0;

alarm[0] = 2 * room_speed;

// Functions

draw_app_version = function() {
	draw_set_halign(fa_right);
	draw_set_color(c_white);
	draw_text(global.gui_width - 20, global.gui_height - 30, global.game_version);
}