if (!_anim_done && _anim_start) {
	if (global.step_timer % 5 == 0) {
		_anim_step += 5;

		if (_anim_step >= 100) {
			_anim_step = 100;
			_anim_done = true;
			alarm[0] = room_speed;
		}
	}
}

