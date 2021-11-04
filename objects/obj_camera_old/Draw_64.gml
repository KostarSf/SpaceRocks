
switch (room) {
	case rm_game:
		draw_gui_game_score();
		draw_gui_game_accuracy();
		draw_gui_game_time();
		draw_gui_game_lives();
		draw_gui_game_ammo();
		//draw_gui_game_stage();
		draw_gui_game_score_multiply();
		
		if (global.draw_dev_gui) {
			draw_gui_dev();
		}
		
		break;
		
	case rm_start:
		draw_sprite_ext(ST_ARCADE_LOGO, 0, sin(global.step_timer / 70), 
			sin(global.step_timer / 100), 2, 2, sin(global.step_timer / 120) / 4, c_white, 1);
		draw_sprite_ext(ST_ARCADE_SUBLOGO, 0, 
			sin(global.step_timer / 50) * 2, sin(global.step_timer / 80) * 2, 2, 2, 
			sin(global.step_timer / 70), c_white, 1);
	
		draw_gui_app_version();
		break;
		
	case rm_win:
		draw_set_halign(fa_center);
		var c = c_lime;
		draw_text_transformed_color(
			display_get_gui_width() / 2, 200, "ТЫ ПОБЕДИЛ!",
			3, 3, 0, c, c, c, c, 1);
		var perc = string(score / global.shoots * 10);
		perc = perc == "NaN" ? string(0) : perc;
		draw_text(
			display_get_gui_width() / 2, 300,
			"ТОЧНОСТЬ: "+perc+"%");
		draw_text(
			display_get_gui_width() / 2, 350,
			"НАЖМИ ВВОД ДЛЯ ПЕРЕЗАПУСКА");
		draw_set_halign(fa_left);
		break;
		
	case rm_gameover:
		draw_set_halign(fa_center);
		var c = c_yellow;
		draw_text_transformed_color(
			display_get_gui_width() / 2, 150, "ИГРА ОКОНЧЕНА",
			3, 3, 0, c, c, c, c, 1);
		draw_text(
			display_get_gui_width() / 2, 250,
			"ФИНАЛЬНЫЙ СЧЁТ: "+string(score));
		draw_text(
			display_get_gui_width() / 2, 275,
			"ТОЧНОСТЬ: "+string(score / global.shoots * 10)+"%");
		draw_text(
			display_get_gui_width() / 2, 350,
			"НАЖМИ ВВОД ДЛЯ ПЕРЕЗАПУСКА");
		draw_set_halign(fa_left);
		break;
		
}

draw_gui_application_borders();

/*
draw_set_color(c_red);
draw_rectangle(display_get_gui_width() / 2 - 1, 0, display_get_gui_width() / 2, display_get_gui_height(), false);
draw_rectangle(0, display_get_gui_height() / 2 - 1, display_get_gui_width(), display_get_gui_height() / 2, false);

draw_rectangle(display_get_gui_width() / 3, display_get_gui_height() / 3, 
	display_get_gui_width() - display_get_gui_width() / 3, 
	display_get_gui_height() - display_get_gui_height() / 3, true);
	

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(10, 10, "RES: "+string(camera_width) + " "+string(camera_height));
draw_text(10, 30, "DSP: "+string(display_get_gui_width()) + " "+string(display_get_gui_height()));
draw_text(10, 70, "POS: "+string(camera_x) + " "+string(camera_y));
draw_text(10, 90, "SCL: "+string(camera_scale));
*/