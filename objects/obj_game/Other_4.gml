if (room = rm_game) {
	audio_play_sound(msg_song, 10, true);
	repeat (2) {
		var xx = choose(
			irandom_range(0, room_width*0.3),
			irandom_range(room_width*0.7, room_width));
		var yy = choose(
			irandom_range(0, room_height*0.3),
			irandom_range(room_height*0.7, room_height));
		
		instance_create_layer(xx, yy, "Instances", obj_aster);
	}
	
	alarm[0] = 60;
	
	alarm[2] = item_delay * room_speed;
} else {
	audio_stop_sound(msg_song);
}