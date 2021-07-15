image_index = irandom_range(0, image_number -1);

speed = random_range(2, 4);
direction = irandom_range(0, 359);

_picked_up = false;

_hspeed = 0;
_vspeed = 0;

_rotate_speed = irandom_range(-5, 5);

_under_vacuum = false;

vacuum_multiply = 0;
vacuum_multiply_increase = function() {
	if (vacuum_multiply < 0.5) vacuum_multiply += 0.005;
	else if (vacuum_multiply < 1) vacuum_multiply += 0.01;
	else {
		vacuum_multiply *= 1.05;
	}
}

vacuum_on = function() {
	_under_vacuum = true;
}

vacuum_off = function() {
	_under_vacuum = false;
}

_can_be_vacuumed = false;
can_be_vacuumed = function() {
	return _can_be_vacuumed;
}


reset_motion = function() {
	_can_be_vacuumed = true;
	image_angle = 0;
	_rotate_speed = 0;
	speed = 0;
}

picked_up = function() {
	if (_picked_up) return;
	_picked_up = true;
	
	var _snd = audio_play_sound(snd_fuel, 4, false);
	
	switch (image_index) {
		case 0:
			fuel_add(30);
			audio_sound_pitch(_snd, 1.2);
			break;
		case 1:
			fuel_add(60);
			audio_sound_pitch(_snd, 1);
			break;
		case 2: 
			fuel_add(90);
			audio_sound_pitch(_snd, 0.8);
			break;
	}
}