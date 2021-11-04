if (instance_exists(obj_player)) {
	var _dist = point_distance(x, y, obj_player.x, obj_player.y);
	
	if (_dist < 200 || _dist > 4000) instance_destroy();
}