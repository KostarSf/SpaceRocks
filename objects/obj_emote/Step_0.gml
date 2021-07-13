var obj = undefined;

if (instance_exists(obj_ship_animated)) {
	obj = obj_ship_animated;
} else if (instance_exists(obj_ship)) {
	obj = obj_ship;
}

if (obj != undefined) {
	x = obj.x;
	y = obj.y - 32;
}