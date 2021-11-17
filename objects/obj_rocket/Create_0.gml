/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

// Inherit the parent event
event_inherited();

set_parent_ship = function(ship) {
	parent_ship = ship;
	move_speed = ship.speed;
	
	faction = ship.faction;
	
	speed = move_speed;
	direction = ship.direction;
	image_angle = ship.image_angle;
	
	spawn_x = x + lengthdir_x(12, image_angle);
	spawn_y = y + lengthdir_y(12, image_angle);
	
	x = spawn_x;
	y = spawn_y;
	
	motion_add(image_angle, 2);
}

damage = 100;
active = false;

alarm[0] = room_speed;