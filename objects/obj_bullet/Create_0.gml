parent_ship = undefined;
move_speed = 0;

spawn_x = x;
spawn_y = y;

damage = 40;

faction = factions.none;

set_parent_ship = function(ship) {
	parent_ship = ship;
	move_speed = 3.1 + ship.speed / 1.6;
	
	faction = ship.faction;
	
	speed = move_speed;
	direction = ship.image_angle;
	image_angle = direction;
	
	spawn_x = x + lengthdir_x(12, image_angle);
	spawn_y = y + lengthdir_y(12, image_angle);
	
	x = spawn_x;
	y = spawn_y;
}

take_damage = function(amount) {
	instance_destroy();
}

depending_move = function(hmove, vmove) {
	x -= hmove;
	y -= vmove;
}