draw_sprite_ext(ST_ARCADE_LOGO, 0, sin(global.steps / 70) + room_width / 2, 
	sin(global.steps / 100) + 96, 2, 2, sin(global.steps / 120) / 4, c_white, 1);
draw_sprite_ext(ST_ARCADE_SUBLOGO, 0, 
	sin(global.steps / 50) * 2 + room_width / 2, sin(global.steps / 80) * 2 + 96, 2, 2, 
	sin(global.steps / 70), c_white, 1);
	
if (show_start_button) {
	draw_gui_text_2(room_width / 2, room_height / 2, "Press Space to start", fa_center, fa_middle, 1.5, 0, c_white, start_button_opacity * (1 - sin(global.steps / 50) / 1.5));
}
	
draw_app_version();