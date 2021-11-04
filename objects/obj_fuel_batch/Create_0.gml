if (!instance_exists(obj_player)) exit;

create_pirates = true;

_distance = irandom_range(1000, 3500);

_min_angle = obj_player.direction + 30;
_max_angle = obj_player.direction - 30;

x = lengthdir_x(_distance, irandom_range(_min_angle, _max_angle)) + obj_player.x;
y = lengthdir_y(_distance, irandom_range(_min_angle, _max_angle)) + obj_player.y;


depending_move = function(hmove, vmove) {
	x -= hmove;
	y -= vmove;
}

alarm[0] = 1;