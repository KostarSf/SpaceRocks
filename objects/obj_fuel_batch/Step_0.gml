//instance_destroy();
x += -global.ship_hspeed /*/ global.ship_moving_mult*/;
y += -global.ship_vspeed /*/ global.ship_moving_mult*/;

if (instance_exists(obj_ship)) {
	var _dist = point_distance(x, y, obj_ship.x, obj_ship.y);
	
	if (_dist < 100 || _dist > 4000) instance_destroy();
}