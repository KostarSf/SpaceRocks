if (!_begin_animations || animation_type == ship_animation_type.none ) exit;

switch (animation_type) {
	case ship_animation_type.game_intro:
		cursor_sprite = -1;
		
		if (keyboard_check_pressed(vk_escape) 
			|| keyboard_check_pressed(vk_space) 
			|| keyboard_check_pressed(vk_enter)) {
				if (!instance_exists(obj_far_star)) {
					instance_create_layer(0, 0, "Instances", obj_far_star);
				}
				room_goto(rm_game);
				instance_create_layer(0, 0, "Instances", obj_window_fadeout_simple);
			}
	
		if (y > room_height + 50) {
			speed = 2;
		} else if (y > room_height / 2 + 21) {
			speed = (point_distance(x, y, x, room_height / 2 + 20) / 70 + 0.1);
			
			
		} else if (y > room_height / 2 + 1) {
			speed = 0.075;
			if (!instance_exists(obj_far_star)) {
				instance_create_layer(0, 0, "Instances", obj_far_star);
			}
			if (instance_number(obj_aster) == 0) {
				var aster = instance_create_layer(room_width / 3, -55, "Instances", obj_aster);
				aster.direction = irandom_range(250, 270);
				aster.move_speed = random_range(0.30, 0.35);
				aster.sprite_index = spr_aster_med;
				
				var aster = instance_create_layer(room_width / 1.4, -45, "Instances", obj_aster);
				aster.direction = irandom_range(280, 290);
				aster.move_speed = random_range(0.15, 0.22);
				aster.sprite_index = choose(spr_aster_large, spr_aster_med);
				
				var aster = instance_create_layer(room_width / 2, -40, "Instances", obj_aster);
				aster.direction = irandom_range(245, 255);
				aster.move_speed = random_range(0.15, 0.25);
				aster.sprite_index = choose(spr_aster_med, spr_aster_small);
			}
		} else {
			speed = 0;
			y = room_height / 2;
			
			room_goto(rm_game);
		}
}