switch (room) {
	case rm_game:
		draw_gui_game_score();
		draw_gui_game_accuracy();
		draw_gui_game_time();
		draw_gui_game_lives();
		draw_gui_game_ammo();
		draw_gui_game_stage();
		draw_gui_game_score_multiply();
		
		if (global.draw_dev_gui) {
			draw_gui_dev();
		}
		
		break;
		
	case rm_start:
		draw_gui_app_version();
		break;
		
	case rm_win:
		draw_set_halign(fa_center);
		var c = c_lime;
		draw_text_transformed_color(
			room_width / 2, 200, "ТЫ ПОБЕДИЛ!",
			3, 3, 0, c, c, c, c, 1);
		var perc = string(score / global.shoots * 10);
		perc = perc == "NaN" ? string(0) : perc;
		draw_text(
			room_width / 2, 300,
			"ТОЧНОСТЬ: "+perc+"%");
		draw_text(
			room_width / 2, 350,
			"НАЖМИ ВВОД ДЛЯ ПЕРЕЗАПУСКА");
		draw_set_halign(fa_left);
		break;
		
	case rm_gameover:
		draw_set_halign(fa_center);
		var c = c_yellow;
		draw_text_transformed_color(
			room_width / 2, 150, "ИГРА ОКОНЧЕНА",
			3, 3, 0, c, c, c, c, 1);
		draw_text(
			room_width / 2, 250,
			"ФИНАЛЬНЫЙ СЧЁТ: "+string(score));
		draw_text(
			room_width / 2, 275,
			"ТОЧНОСТЬ: "+string(score / global.shoots * 10)+"%");
		draw_text(
			room_width / 2, 350,
			"НАЖМИ ВВОД ДЛЯ ПЕРЕЗАПУСКА");
		draw_set_halign(fa_left);
		break;
		
}

draw_gui_application_borders();