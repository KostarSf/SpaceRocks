if (!global.gamePaused) {
	speed = move_speed;
	image_angle += rotate_direction * rotate_speed;
	
	if (global.astero_force_despawn_out_of_room ) {
		move_speed += 0.004;
	}
	
	x += -global.ship_hspeed / global.ship_moving_mult;
	y += -global.ship_vspeed / global.ship_moving_mult;
} else {
	speed = 0;
}

if (global.astero_force_despawn_out_of_room && !point_in_rectangle(x, y, 0, 0, room_width, room_height)) {
	destroy(false, false);
}

move_wrap(true, true, sprite_width);