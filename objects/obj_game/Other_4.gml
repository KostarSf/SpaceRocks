if (room == rm_game_intro || room == rm_game) {
	global.bg_stars_1 = layer_get_id("Stars_1");
	global.bg_stars_2 = layer_get_id("Stars_2");
} else {
	if (instance_exists(obj_aster)) {
		instance_destroy(obj_aster);
		
	}
}

if (room = rm_game) {
	layer_x(global.bg_stars_1, global.bg_stars_1_x);
	layer_y(global.bg_stars_1, global.bg_stars_1_y);
	layer_x(global.bg_stars_2, global.bg_stars_2_x);
	layer_y(global.bg_stars_2, global.bg_stars_2_y);

	
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
	
	alarm[2] = global.item_delay * room_speed;
	
	global.mouse_visible = false;
} else {
	audio_stop_sound(msg_song);
}

if (room == rm_start) {
	open_menu(obj_gui_menu_main);
}

if (room == rm_game_intro) {
	instance_create_layer(0, 0, "Instances", obj_window_fadeout_simple);
	var ship = instance_create_layer(0, 0, "Instances", obj_ship_animated);
	ship.animation_type = ship_animation_type.game_intro;
}