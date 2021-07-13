x = room_width / 3;
y = room_height / 2;

height = 30;

menu_item_titles = ["Начать игру", "Настройки", "Рекорды", "Выйти"];
menu_item_actions = [
	game_start_game,
	game_go_to_options,
	game_go_to_leaderboard,
	game_exit
];
menu_item_ids = [];

_block_control = false;

item_clicked = function(local_id) {
	if (_block_control) return;
	
	audio_play_sound(snd_coin, 1, false);
	script_execute(menu_item_actions[local_id]);
	if (local_id == 0) {
		_block_control = true;
		//instance_destroy(menu_item_ids[local_id]);
		menu_item_ids[local_id].item_disabled = true;
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