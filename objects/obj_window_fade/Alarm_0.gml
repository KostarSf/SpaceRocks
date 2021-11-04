/// @description Setup opacity

switch (transition_type) {
	case fadetype.fadein:
		_opacity = 0;
		break;
	case fadetype.fadeout:
		_opacity = 1;
		break;
}

_setup_done = true;