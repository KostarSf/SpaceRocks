update_bg_stars(player);
add_dynamic_stars(player);

move_layer_instances();
move_layer_instances_background();

if (current_stage() == stage.st1) {
	generate_fuel_batches();
	generate_lonely_pirates();
} else if (instance_number(obj_relay) > 0 && obj_relay.get_player_distance() > 1500) {
	generate_fuel_batches();
	generate_lonely_pirates();
}

session_timer_tick();

if (player._energy == 10000) {
	_current_stage = stage.st2;
}

if (_current_stage == stage.st2 && !_stage_change) {
	_stage_change = true;
	instance_create_layer(x, y, "Instances_Background", obj_relay);
}

_show_help = keyboard_check(vk_f1);