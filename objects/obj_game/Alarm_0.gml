/// @description Asteroids spawn

if (room != rm_game) {
	exit;
}

function create_aster() {
	if (instance_number(obj_aster) > 35) {
		return;
	}
	
	if (choose(0,1) == 0) {
		var xx = choose(0 - 16, room_width + 16);
		var yy = irandom_range(0, room_height);
	} else {
		var xx = irandom_range(0, room_width);
		var yy = choose(0 - 16, room_height + 16);
	}

	instance_create_layer(xx, yy, "Instances", obj_aster);
}

if (irandom_range(0, 4) == 0) {
	repeat(irandom_range(1, 5)) {
		create_aster();
	}
} else {
	create_aster();
}

aster_delay = 0;

if (score < 1000) {
	var score_relative = 0 + (20 - 0) * ((score - 0) / (1000 - 0));
	aster_delay = (power(score_relative, 0.4)*4) / 2 * (-1) + 7;
} else {
	aster_delay = 0.35;
}




alarm[0] = aster_delay * room_speed;