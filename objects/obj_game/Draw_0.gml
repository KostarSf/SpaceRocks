switch (room) {
	case rm_game:
		draw_text(20, 20, "СЧЕТ: "+string(score));
		var perc = string(floor(score / global.shoots * 10));
		perc = perc == "NaN" ? string(0) : perc;
		draw_text(20, 40, "ТОЧНОСТЬ: "+perc+"%");
		
		draw_set_halign(fa_right);
		draw_text(room_width - 20, 20, "ЖИЗНЬ: "+string(lives));
		draw_text(room_width - 20, 40, "ЗАРЯДОВ: "+string(global.bullets));
		draw_set_halign(fa_left);
		
		break;
		
	case rm_start:
		draw_set_halign(fa_center);
		var c = c_yellow;
		draw_text_transformed_color(
			room_width / 2, 100, "SPACE ROCKS",
			3, 3, 0, c, c, c, c, 1);
		draw_text(
			room_width / 2, 200,
			"Продержись как можно дольше!\n\n" +
			
			"ВВЕРХ: лететь\n" + 
			"ВЛЕВО/ВПРАВО: повернуть\n" +
			"Z: выстрелить\n" +
			"X: Супер-Заряд (тр. 50 зарядов)\n\n" +
			
			">> НАЖМИ ВВОД ЧТОБЫ НАЧАТЬ <<");
		draw_set_halign(fa_right);
		draw_text(room_width - 20, room_height - 30, game_version);
		draw_set_halign(fa_left);
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