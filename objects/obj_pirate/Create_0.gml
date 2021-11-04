event_inherited();

direction = random(360);
image_blend = c_ltgray;

enum behavior_state {
	idle,
	purcuit,
	hit,
	damaged,
}

max_hitpoints = 200;
hitpoints = max_hitpoints;
purcuit_distance = 350;
spotted_distance = 350;
chasing_target = instance_find(obj_player, 0);
current_behavior = behavior_state.idle;

max_rot_speed = 5;

_able_to_shoot = true;

_target_spotted = false;
_can_be_idle = true;

_target_distance = 0;
_target_angle = 0;
_damaged = false;

_ignore_asteros = false;

_nearest_asteros = ds_list_create();
_nearest_asteros_count = 0;

_nearest_pirates = ds_list_create();
_nearest_pirates_count = 0;

alarm[0] = 1 * room_speed;
alarm[2] = 0.2 * room_speed;

depending_move = function(hmove, vmove) {
	x -= hmove;
	y -= vmove;
}

power_use = function(amount) { return true; }

avade_asteros = function() {
	if (_nearest_asteros_count > 0) {
		for (var i = 0; i < _nearest_asteros_count; i++) {
			var _pir = _nearest_asteros[| i];
			if (!instance_exists(_pir)) continue;
		
			var _dir = point_direction(_pir.x, _pir.y, x, y) - 20;
		
			motion_add(_dir, 0.1);
		}
	}
}

avade_pirates = function() {
	if (_nearest_pirates_count > 0) {
		for (var i = 0; i < _nearest_pirates_count; i++) {
			var _pir = _nearest_pirates[| i];
			if (!instance_exists(_pir)) continue;
		
			var _dir = point_direction( _pir.x, _pir.y, x, y) - 20;
		
			motion_add(_dir, 0.04);motion_add(_dir, 0.04);
		}
	}
}

try_to_shoot_to_target = function() {
	if (!_able_to_shoot) return;
	if (current_behavior == behavior_state.purcuit && global.steps % 20 == 0 && irandom(5) == 0) {
		if (collision_line(x, y, chasing_target.y, chasing_target.y, obj_pirate, false, true)) return;
		var bul = instance_create_layer(x, y, "Instances", obj_bullet);
		bul.set_parent_ship(id);
		bul.speed = 2 + speed * 1.5;
	}
}


draw_engine_fire = function() {
	static anim_accell_frame = 0;
	
	if (speed > 0.01 && current_behavior != behavior_state.damaged) {
		draw_sprite_ext(spr_ship_accel, anim_accell_frame, x, y, 1, 1, image_angle, c_white, 1);
		if (global.steps % 10 == 0) {
			anim_accell_frame += 1;
		}
	}
}