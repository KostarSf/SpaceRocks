/// @description Asteroids spawn

if (room != rm_game) {
	exit;
}

if (instance_number(obj_aster) < global.asteroMaxCount) {
	if (irandom_range(0, 1) == 0) {
		if (instance_number(obj_aster) <= global.asteroMaxCount / 1.5) {
			repeat(irandom_range(global.asteroMaxCount / 4, global.asteroMaxCount / 2)) {
				create_aster_beyond_borders();
			}
		} else {
			repeat(irandom_range(1, 10)) {
				create_aster_beyond_borders();
			}
		}
		
	} else {
		create_aster_beyond_borders();
	}
}

var min_astero_delay_at = 7000;
if (score < min_astero_delay_at) {
	//var score_relative = 0 + (20 - 0) * ((score - 0) / (1000 - 0));
	var score_relative = linear_interpolate_value(score, 0, min_astero_delay_at, 0, 20);
	global.aster_delay = (power(score_relative, 0.4)*4) / 2 * (-1) + 7;
} else {
	global.aster_delay = 0.35;
}

calculate_astero_max_count();


alarm[0] = global.aster_delay * room_speed;