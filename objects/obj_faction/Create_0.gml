faction = factions.neutral;
hitpoints = 1;

_damage_taken = 0;

take_damage = function(amount) {
	_damage_taken = amount;
	event_user(0);
	_damage_taken = 0;
	
	_check_hitpoints();
}

get_taken_damage = function() {
	return _damage_taken;
}

is_alive = function() {
	return hitpoints > 0;
}

_check_hitpoints = function() {
	if (hitpoints <= 0) {
		event_user(1);
	}
}