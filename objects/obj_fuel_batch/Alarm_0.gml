/// @description create fuel


repeat (irandom_range(5, 30)) {
	var _x = irandom_range(x - 50, x + 50);
	var _y = irandom_range(y - 50, y + 50);
	
	var _fuel = instance_create_layer(_x, _y, "Instances", obj_fuel);
	_fuel.reset_motion();
}


if (create_pirates && irandom(4) == 0) {
	instance_create_layer(x, y, "Instances", obj_pirate);
}