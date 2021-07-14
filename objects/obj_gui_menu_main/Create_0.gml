x = display_get_gui_width() / 3;
y = display_get_gui_height() / 2;

height = 30;

menu_item_titles = ["Начать игру", "Настройки", "Об игре", "Выйти"];
menu_item_actions = [
	game_start_game,
	game_go_to_options,
	undefined,
	game_exit
];
menu_item_ids = [];

_block_control = false;

item_clicked = function(local_id) {
	if (_block_control) return;
	if (menu_item_ids[local_id].item_disabled) return;
	if (menu_item_actions[local_id] == undefined) return;
	
	audio_play_sound(snd_coin, 1, false);
	script_execute(menu_item_actions[local_id]);
	if (local_id == 0) {
		_block_control = true;
		menu_item_ids[local_id].item_disabled = true;
		obj_menu_ship.start_stage_2();
		//audio_stop_sound(msc_menu);
		audio_sound_gain(msc_menu, 0, 1500);
	} else {
		close();
	}
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