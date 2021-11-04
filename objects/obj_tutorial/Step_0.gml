switch (_tutorial_stage) {
	case tutorial_stage.tutorial_move:
		sprite_index = spr_tutorial_move;
		x = obj_player.x;
		y = obj_player.y;
		
		image_angle = point_direction(x, y, _pir.x, _pir.y) - 90;
		
		if (point_distance(x, y, _pir.x, _pir.y) < 300) {
			_tutorial_stage = tutorial_stage.tutorial_shoot;
		}
		
		break;
		
	case tutorial_stage.tutorial_shoot:
		sprite_index = spr_tutorial_shoot;
		image_angle = 0;
	
		if (instance_exists(_pir)) {
			x = _pir.x;
			y = _pir.y;
		} else {
			_en = instance_nearest(x, y, obj_energy);
			_tutorial_stage = tutorial_stage.tutorial_pickup;
		}
	
		break;
		
	case tutorial_stage.tutorial_pickup:
		sprite_index = spr_tutorial_pickup;
		image_angle = 0;
	
		if (instance_exists(_en)) {
			x = _en.x;
			y = _en.y;
		} else {
			_tutorial_stage = tutorial_stage.tutorial_help;
		}
	
		break;
		
	case tutorial_stage.tutorial_help:
		sprite_index = spr_tutorial_help;
		image_angle = 0;
	
		x = obj_player.x;
		y = obj_player.y;
	
		if (keyboard_check_pressed(vk_f1)) {
			instance_destroy();
		}
	
		break;
}