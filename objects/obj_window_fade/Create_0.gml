enum fadetype {
	fadein,
	fadeout,
}

transition_type = fadetype.fadein;

// in seconds
transition_duration = 1;

alarm[0] = 1;

_opacity = 0;
_setup_done = false;

change_opacity = function() {
	if (!_setup_done) return;
	
	switch (transition_type) {
		case fadetype.fadein:
			if (_opacity >= 1) instance_destroy();
		
			_opacity += 1 / (room_speed * transition_duration);
			if (_opacity > 1) _opacity = 1;
			break;
		case fadetype.fadeout:
			if (_opacity <= 0) instance_destroy();
		
			_opacity -= 1 / (room_speed * transition_duration);
			if (_opacity < 0) _opacity = 0;
			break;
	}
}