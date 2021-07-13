/// @description Items spawn

if (room == rm_game) {
	spawn_item();
	
	if (random_range(0, 100) < global.item_delay_extra_chance) {
		alarm[2] = irandom_range(2, global.item_delay_min) * room_speed;
	} else {
		alarm[2] = global.item_delay * room_speed;
	}
}