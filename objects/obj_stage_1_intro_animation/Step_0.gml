if (!_begin_animations || animation_type == ship_animation_type.none ) exit;

switch (animation_type) {
	case ship_animation_type.game_intro:
		var _skiped = keyboard_check_pressed(vk_escape) 
			|| keyboard_check_pressed(vk_space) 
			|| keyboard_check_pressed(vk_enter);
	
		if (_skiped) {
				create_far_star_animation();
				create_first_astero();
				room_goto(rm_stage_1);
				play_window_transition(obj_window_fade, fadetype.fadeout, 2);
			}
	
		if (y > room_height + 50) {
			
			speed = 2;
		} else if (y > room_height / 2 + 21) {
			speed = (point_distance(x, y, x, room_height / 2 + 20) / 70 + 0.1);
			
			_bg_target.speed *= 0.995;
			
		} else if (y > room_height / 2 + 1) {
			_bg_target.speed *= 0.98;
			
			speed = 0.075;
			create_far_star_animation();
			create_first_astero();
		} else {
			_bg_target.speed = 0;
			
			speed = 0;
			y = room_height / 2;
			
			room_goto(rm_stage_1);
		}
}