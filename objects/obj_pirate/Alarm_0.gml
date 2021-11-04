/// @description change state timer


if (current_behavior == behavior_state.damaged) exit;

_target_distance = point_distance(x, y, chasing_target.x, chasing_target.y);
_target_angle = point_direction(x, y, chasing_target.x, chasing_target.y);

if (_target_distance > 4000) instance_destroy();

if (current_stage() == stage.st1) {
	spotted_distance = 350;
} else {
	spotted_distance = 600;
}

var _dist = _target_spotted ? purcuit_distance : spotted_distance;

if (current_behavior != behavior_state.hit) {
	if (_target_distance < _dist || !_can_be_idle) {
		current_behavior = behavior_state.purcuit;
	} else {
		current_behavior = behavior_state.idle;
		_target_spotted = false;
		_can_be_idle = true;
	}
} else if (_target_distance > _dist && _can_be_idle) {
	current_behavior = behavior_state.idle;
		_target_spotted = false;
		_can_be_idle = true;
}

if (current_behavior == behavior_state.purcuit) {
	if (!_target_spotted) {
		_target_spotted = true;
		_can_be_idle = false;
		alarm[3] = 5 * room_speed;
	}
}

alarm[0] = 0.7 * room_speed;