/// @description Use once

event_inherited();

if (is_undefined(parent_ship)) exit;

if (parent_ship.power_use(40, true)) {
	create_shoot_fire(parent_ship, spr_shoot_fire);

	var bullet = instance_create_layer(x, y, parent_ship.layer, obj_bullet);
	bullet.set_parent_ship(parent_ship);
	bullet.damage += parent_ship.speed * 4;
}

