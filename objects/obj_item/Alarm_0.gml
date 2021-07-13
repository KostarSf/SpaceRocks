/// @description Move

if (!global.gamePaused) {
	if (picked_up) {
		exit;
	}

	if (x > room_width + 32) {
		instance_destroy();
		item_delay_add(-20);
	}

	var border_margin = 64;

	x = x + move_step;
	y = spawn_y + (global.shipY * 0.3);

	if (y < border_margin) {
		y = border_margin;
	} else if (y > room_height - border_margin) {
		y = room_height - border_margin;
	}
}

alarm[0] = move_speed * room_speed;