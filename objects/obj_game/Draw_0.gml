switch (room) {
	case rm_game:
		draw_text(20, 20, "СЧЕТ: "+string(score));
		var perc = string(floor(score / global.shoots * 10));
		perc = perc == "NaN" ? string(0) : perc;
		draw_text(20, 40, "ТОЧНОСТЬ: "+perc+"%");
		
		if (draw_dev_gui) {
			var ship_angle = 0;
			var ship_direction = 0;
			var ship_dir_diff = 0;
			var ship_curr_speed = 0;
			
			if (instance_number(obj_ship)) {
				ship_angle = obj_ship.image_angle;
				ship_direction = obj_ship.direction;
				ship_dir_diff = obj_ship.direction_difference;
				ship_curr_speed = obj_ship.current_speed;
			}
			
			draw_text(20, 80, "ПОВОРОТ: "+string(ship_angle));
			draw_text(20, 100, "НАПРАВЛЕНИЕ: "+string(ship_direction));
			draw_text(20, 120, "РАЗНИЦА: "+string(ship_dir_diff));
			
			draw_text(20, 160, "СКОРОСТЬ: "+string(ship_curr_speed));
			
			draw_text(20, 180, "БЕССМЕРТИЕ: "+string(global.god_mode));
		}
		
		draw_set_halign(fa_right);
		draw_text(room_width - 20, 20, "ЖИЗНЬ: "+string(lives));
		draw_text(room_width - 20, 40, "ЗАРЯДОВ: "+string(global.bullets));
		
		if (draw_dev_gui) {
			draw_text(room_width - 20, 80, "АСТЕР: "+string(instance_number(obj_aster)));
			draw_text(room_width - 20, 100, "МАКС: "+string(asteroMaxCount));
		
			draw_text(room_width - 20, 120, "ПРЕДМЕТ: "+string(floor(alarm[2]/room_speed)));
			
			draw_text(room_width - 20, 150, "МЫШЬ: "+string(mouse_x)+" "+string(mouse_y));
			draw_text(room_width - 20, 170, "ДВИГАЕТСЯ: "+string(global.mouseWasMoved));
		}
		
		draw_set_halign(fa_left);
		
		break;
		
	case rm_start:
		draw_set_halign(fa_center);
		var c = c_yellow;
		draw_text_transformed_color(
			room_width / 2, 90, "SPACE ROCKS",
			3, 3, 0, c, c, c, c, 1);
		draw_text(
			room_width / 2, 170,
			"Продержись как можно дольше!\n\n" +
			
			"Управление мышью! Либо:\n\n" +
			
			"ВВЕРХ: лететь\n" + 
			"ВЛЕВО/ВПРАВО: повернуть\n" +
			"Z: выстрелить\n" +
			"X: Супер-Заряд (тр. 50 зарядов)\n\n" +
			
			"ESC: Пауза   R: Быстрый рестарт\n\n" + 
			
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