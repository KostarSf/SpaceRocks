if (!instance_exists(obj_ship)) exit;

_distance = irandom_range(1000, 3500);

_min_angle = obj_ship.direction + 30;
_max_angle = obj_ship.direction - 30;

x = lengthdir_x(_distance, irandom_range(_min_angle, _max_angle)) + obj_ship.x;
y = lengthdir_y(_distance, irandom_range(_min_angle, _max_angle)) + obj_ship.y;

alarm[0] = 1;