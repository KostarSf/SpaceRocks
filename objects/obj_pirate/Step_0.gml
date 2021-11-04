image_angle = direction;

_damaged = hitpoints < max_hitpoints / 2;

if (_damaged) {
	image_index = 1;
	if (irandom_range(0, 7) == 0) {
		create_particles_ext_2(x, y, 1, direction, 90, 0.3, 0.02, 1.5, 0.01);
	}
	if (current_behavior != behavior_state.damaged) {
		direction += irandom_range(-2, 2);
	}
} else {
	image_index = 0;
}

if (hitpoints <= 10 && current_behavior != behavior_state.damaged) {
	current_behavior = behavior_state.damaged;
	create_particles_ext_2(x, y, 15, 0, 359, 1, 0.02, 1.5, 0.01);
}



switch (current_behavior) {
	case behavior_state.idle:
		avade_pirates();
		avade_asteros();
		speed *= 0.95;
		break;
	case behavior_state.purcuit:
		avade_pirates();
		avade_asteros();
	
		var _angle = angle_difference(direction, _target_angle);
		
		var max_speed;
		
		if (_target_distance > 200) {
			max_speed = chasing_target.speed * 1.15;
		} else if (_target_distance < 120) {
			max_speed = chasing_target.speed * 1.5;
		} else {
			max_speed = chasing_target.speed * 0.95;
		}
		
		var _rot_speed = lin_int(speed, 0, max_speed, 2, max_rot_speed);
		
		direction -= min(abs(_angle), _rot_speed) * sign(_angle);
		
		var _max_speed = chasing_target.speed > 2 ? max_speed : 2.1;
		
		var _desire_speed = lin_int(abs(_angle), 10, 180, _max_speed, 0.5);
		
		
		if (current_stage() == stage.st2 && instance_number(obj_relay) > 0 && obj_relay.get_player_distance() < 1750) {
			_able_to_shoot = false;
			_desire_speed = clamp(_desire_speed, 0, lin_int(obj_relay.get_player_distance(), 1000, 1500, 2, 5));
		} else {
			_able_to_shoot = true;
		}
		
		_desire_speed = clamp(_desire_speed, 0, 15);
		
		speed += (_desire_speed - speed) / 20;
		
		if (abs(_angle) < 30 && chasing_target.is_alive() && _target_distance > 150) {
			try_to_shoot_to_target();
		}
		
		break;
	case behavior_state.hit:
		if (irandom_range(0, 5) == 0) {
			create_particles_ext_2(x, y, 1, direction, 90, 0.5, 0.01, 2, 0.01);
		}
		break;
	case behavior_state.damaged:
		speed *= 0.99;
		if (global.steps % 60 == 0) {
			create_particles_ext_2(x, y, 10, 0, 359, 0.5, 0.01, 2, 0.01);
		}
		break;
}