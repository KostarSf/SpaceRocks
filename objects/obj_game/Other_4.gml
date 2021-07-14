if (room == rm_game_intro || room == rm_game) {
	global.bg_stars_1 = layer_get_id("Stars_1");
	global.bg_stars_2 = layer_get_id("Stars_2");
} else {
	if (instance_exists(obj_aster)) {
		instance_destroy(obj_aster);
		
	}
}

if (room = rm_game) {
	var _batch = instance_create_layer(0, 0, "Instances", obj_fuel_batch);
	_batch.x = room_width / 2;
	_batch.y = 0 ;
	
	repeat(irandom_range(1, 3)) {
		var _fuel = instance_create_layer(room_width / 2, 20, "Instances", obj_fuel);
		_fuel.speed = random_range(6, 7);
		_fuel.direction = irandom_range(270 - 20, 270 + 20);
	}
	
	layer_x(global.bg_stars_1, global.bg_stars_1_x + obj_camera.camera_x);
	layer_y(global.bg_stars_1, global.bg_stars_1_y + obj_camera.camera_y);
	layer_x(global.bg_stars_2, global.bg_stars_2_x + obj_camera.camera_x);
	layer_y(global.bg_stars_2, global.bg_stars_2_y + obj_camera.camera_y);

	
	audio_play_sound(msg_song, 10, true);
	if (instance_number(obj_aster) == 0) {
		repeat (3) {
			var xx = choose(
				irandom_range(0, room_width*0.3),
				irandom_range(room_width*0.7, room_width));
			var yy = choose(
				irandom_range(0, room_height*0.3),
				irandom_range(room_height*0.7, room_height));
		
			instance_create_layer(xx, yy, "Instances", obj_aster);
		}
	}
	
	alarm[0] = 60;
	
	//alarm[2] = global.item_delay * room_speed;
	
	global.mouse_visible = false;
	
	reset_game_timer();
} else {
	audio_stop_sound(msg_song);
}

if (room == rm_start) {
	instance_destroy(obj_emote);
	global.gamePaused = false;
	if (!instance_exists(obj_menu_ship)) instance_create_layer(0, 0, "Instances", obj_menu_ship);
	open_menu(obj_gui_menu_main);
	if (!audio_is_playing(msc_menu)) {
		audio_play_sound(msc_menu, 2, true);
		audio_sound_gain(msc_menu, 0, 0);
		audio_sound_gain(msc_menu, 0.5, 1000);
	}
} else {
	audio_stop_sound(msc_menu);
}

if (room == rm_game_intro) {
	instance_create_layer(0, 0, "Instances", obj_window_fadeout_simple);
	var ship = instance_create_layer(0, 0, "Instances", obj_ship_animated);
	ship.animation_type = ship_animation_type.game_intro;
}