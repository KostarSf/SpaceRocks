x = display_get_gui_width() / 3;
y = display_get_gui_height() / 3;

menu_item_titles = ["Продолжить", "Рестарт", "Выйти"];
menu_item_actions = [
	game_pause_toggle,
	game_restart_session,
	game_go_to_main_menu
];
menu_item_ids = [];

item_clicked = function(local_id) {
	audio_play_sound(snd_coin, 1, false);
	script_execute(menu_item_actions[local_id]);
	close();
}

close = function() {
	var i = array_length(menu_item_ids);
	repeat (i) {
		i -= 1;
		instance_destroy(menu_item_ids[i]);
	}
	
	instance_destroy();
}

alarm[0] = 1;