if (keyboard_check_pressed(vk_enter)) {
	switch (room) {
		case rm_start:
			audio_play_sound(snd_coin, 1, false);
			room_goto(rm_game);
			break;
			
		case rm_win:
		case rm_gameover:
			audio_play_sound(snd_coin, 1, false);
			game_restart();
			break;
	}
}

if (room == rm_game) {
	
	if (global.alive == false) {
		global.alive = true;
		alarm[1] = 60;
	}
	
	if (score >= 9999) {
		room_goto(rm_win);
	}

	if (lives <= 0) {
		room_goto(rm_gameover);
	}
	
	var stars_1 = layer_get_id("Stars_1");
	var stars_2 = layer_get_id("Stars_2");
	
	layer_x(stars_2, bg_offset + global.shipX * 0.3);
	layer_y(stars_2, global.shipY * 0.3);
	
	layer_x(stars_1, bg_offset / 2 + global.shipX * 0.2);
	layer_y(stars_1, global.shipY * 0.2);
	
	bg_offset += 1;
}