/// @description On take damage
event_inherited();

if (current_stage() == stage.st2 && power_use(get_taken_damage() * 2.2, true)) {
	lives_decrease();
	exit;
}

lives_decrease();

if (!is_alive()) exit;

fuel_use(lin_int(get_taken_damage(), 0, 100, _fuel / 10, _fuel / 4));
//instance_create_layer(x, y, "Player", obj_blow);
