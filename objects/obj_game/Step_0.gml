global.step_timer += 1;

if (keyboard_check_pressed(vk_enter)) {
	switch (room) {
		/*case rm_start:
			audio_play_sound(snd_coin, 1, false);
			room_goto(rm_game);
			break;*/
			
		case rm_win:
		case rm_gameover:
			game_go_to_main_menu();
			break;
	}
}

if (global.mouseWasMoved) {
	cursor_sprite = spr_cursor;
}


if (global.draw_dev_gui) {
	draw_set_color(c_red);
	draw_rectangle(0, 0, room_width, room_height, true);
}


if (room == rm_game_intro) {
	if (!audio_is_playing(msc_game_theme_1_intro) && !audio_is_playing(msc_game_theme_1)) {
		audio_play_sound(msc_game_theme_1, 10, true);
	}
	
	
	var stars_1 = layer_get_id("Stars_1");
	var stars_2 = layer_get_id("Stars_2");
	
	var _hspeed = 0, _vspeed = 0;
	if (instance_exists(obj_ship_animated)) {
		_hspeed = obj_ship_animated.hspeed;
		_vspeed = obj_ship_animated.vspeed;
	}
	
	var _bg_speed = global.background_speed_multiply * (global.game_stage - 1) * 1.05;
	if (global.background_speed < _bg_speed) {
		global.background_speed += 0.02;
		if (global.background_speed > _bg_speed) 
			global.background_speed = _bg_speed;
	} else if (global.background_speed > _bg_speed) {
		global.background_speed -= 0.02;
		if (global.background_speed < _bg_speed) 
			global.background_speed = _bg_speed;
	}
	
	layer_hspeed(stars_2, global.background_speed + _hspeed * -0.3);
	layer_vspeed(stars_2, _vspeed * -0.3);
	
	layer_hspeed(stars_1, global.background_speed / 1.5 + _hspeed * -0.2);
	layer_vspeed(stars_1, _vspeed * -0.2);
	
	global.bg_stars_1_x = layer_get_x(global.bg_stars_1);
	global.bg_stars_1_y = layer_get_y(global.bg_stars_1);
	global.bg_stars_2_x = layer_get_x(global.bg_stars_2);
	global.bg_stars_2_y = layer_get_y(global.bg_stars_2);
} else if (room == rm_game) {
	
	if (!global.gamePaused && !audio_is_playing(msc_game_theme_1_intro) && !audio_is_playing(msc_game_theme_1)) {
		audio_play_sound(msc_game_theme_1, 10, true);
	} else if (global.gamePaused) {
		audio_pause_sound(msc_game_theme_1);
	} else {
		audio_resume_sound(msc_game_theme_1);
	}
	
	global.sessionTime = floor((current_time - global.sessionStartedAtModify) / 1000);
	if (global.sessionTime > 600) global.sessionTime = 600;
	global.item_create_chanse = 50 - ceil(power(global.sessionTime, 1.7) / 1175);
	
	if (keyboard_check_pressed(vk_escape)) {
		game_pause_toggle();
	}
	
	if (global.game_gui_animated_offset > 0 && global.step_timer % 3 == 0) {
		global.game_gui_animated_offset -= 3;
	}
	if (global.game_gui_animated_offset < 0) {
		global.game_gui_animated_offset = 0;
	}
	
	if (global.alive == false) {
		global.alive = true;
		alarm[1] = 60;
	}
	
	global.bullets = clamp(global.bullets, 0, global.maxBullets);
	
	if (score < 1000) {
		global.game_stage = 1;
		global.astero_force_despawn_out_of_room = false;
	} else if (score < 3000) {
		global.game_stage = 2;
		global.astero_force_despawn_out_of_room = false;
	} else if (score < 6000) {
		global.game_stage = 3;
		global.astero_force_despawn_out_of_room = false;
	} else if (score < 10000) {
		global.game_stage = 4;
		global.astero_force_despawn_out_of_room = false;
	} else {
		global.game_stage = 5;
		global.astero_force_despawn_out_of_room = true;
		global.prepare_for_finish = true;
	}

	if (global.prepare_for_finish) {
		if (instance_number(obj_aster) == 0 && !global.start_win_delay_counter) {
			global.start_win_delay_counter = true;
			alarm[3] = room_speed * 5;
		}
	}

	if (lives <= 0) {
		room_goto(rm_gameover);
	}
	
	var stars_1 = layer_get_id("Stars_1");
	var stars_2 = layer_get_id("Stars_2");
	
	var _hspeed = 0, _vspeed = 0;
	if (instance_exists(obj_ship)) {
		_hspeed = obj_ship.hspeed;
		_vspeed = obj_ship.vspeed;
	}
	
	var _bg_speed = global.background_speed_multiply * (global.game_stage - 1) * 1.05;
	if (global.background_speed < _bg_speed) {
		global.background_speed += 0.02;
		if (global.background_speed > _bg_speed) 
			global.background_speed = _bg_speed;
	} else if (global.background_speed > _bg_speed) {
		global.background_speed -= 0.02;
		if (global.background_speed < _bg_speed) 
			global.background_speed = _bg_speed;
	}
	
	layer_hspeed(stars_2, global.background_speed + _hspeed * -0.3);
	layer_vspeed(stars_2, _vspeed * -0.3);
	
	layer_hspeed(stars_1, global.background_speed / 1.5 + _hspeed * -0.2);
	layer_vspeed(stars_1, _vspeed * -0.2);

	
	if (!global.gamePaused) {
		global.sessionStartedAt = global.sessionStartedAtModify;
	} else {
		global.sessionStartedAtModify = global.sessionStartedAt + (current_time - global.pause_time); 
		alarm[0] += 1;
		alarm[1] += 1;
		alarm[2] += 1;
		global.mouse_visible = true;
		cursor_sprite = spr_cursor;
	}
	
	if (keyboard_check_pressed(192)) {
		global.draw_dev_gui = !global.draw_dev_gui;
	}
	
	if (global.draw_dev_gui) {
		if (keyboard_check_pressed(vk_f1)) {
			global.god_mode = !global.god_mode;
		}
		
		if (keyboard_check_pressed(vk_f2)) {
			lives = 5;
			global.bullets = 999;
		}
		
		if (keyboard_check_pressed(vk_f3)) {
			score += 200;
		}
		
		if (keyboard_check_pressed(vk_f4)) {
			score -= 500;
			if (score < 0) score = 0;
		}
	}
}