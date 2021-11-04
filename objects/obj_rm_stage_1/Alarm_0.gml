/// @description Astero spawn timer

if (astero_count < astero_max) {
	if (current_stage() == stage.st1) {
		var _new_astero_count = irandom_range(5, astero_max div 1.5);
		repeat (_new_astero_count) {
			create_aster_beyond_view();
		}
	} else if (instance_number(obj_relay) > 0 && obj_relay.get_player_distance() > 1500) {
		var _new_astero_count = irandom_range(5, astero_max div 1.5);
		repeat (_new_astero_count) {
			create_aster_beyond_view();
		}
	}
}

alarm[0] = 1.5 * room_speed;