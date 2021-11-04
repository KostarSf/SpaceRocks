enum stage {
	st1,
	st2
}

player = instance_create_layer(room_width / 2, room_height / 2, "Player", obj_player);

layer_instances = layer_get_id("Instances");
layer_instances_background = layer_get_id("Instances_Background");

astero_count = 0;
astero_max = 100;

session_time = 0;

time = 15; //mins

_current_stage = stage.st1;
_stage_change = false;

_show_help = false;

// Setups

if (instance_exists(obj_aster)) {
	astero_count = instance_number(obj_aster);
	for (var i = 0; i < astero_count; i++) {
		var _aster = instance_find(obj_aster, i);
		_aster.x += global.camera.camera_x;
		_aster.y += global.camera.camera_y;
	}
}

if (instance_exists(obj_bg_star)) {
	for (var i = 0; i < instance_number(obj_bg_star); i++) {
		var _star = instance_find(obj_bg_star, i);
		_star.x += global.camera.camera_x + _star.get_camera_update_pos(global.camera.camera_x);
		_star.y += global.camera.camera_y + _star.get_camera_update_pos(global.camera.camera_y);
		_star.target = player;
	}
}

if (instance_exists(obj_far_star_animated)) {
	obj_far_star_animated.x += global.camera.camera_x;
	obj_far_star_animated.y += global.camera.camera_y;
}

while (astero_count < astero_max) {
	create_aster_beyond_view();
}

var _batch = instance_create_layer(0, 0, "Instances", obj_fuel_batch);
_batch.x = room_width / 2;
_batch.y = 0 ;
_batch.create_pirates = false;
	
repeat(irandom_range(1, 3)) {
	var _fuel = instance_create_layer(room_width / 2, 20, "Instances", obj_fuel);
	_fuel.speed = random_range(6, 7);
	_fuel.direction = irandom_range(270 - 20, 270 + 20);
}

var _prt = instance_create_layer(room_width / 2, 0, "Instances", obj_pirate);
_prt.hitpoints = 1;
_prt._ignore_asteros = true;

if (is_first_start()) {
	instance_create_layer(x, y, "Player", obj_tutorial);  
}

alarm[0] = 2 * room_speed;

// Functions


move_layer_instances = function() {
	var _elements = layer_get_all_elements(layer_instances);
	
	for (var i = 0; i < array_length(_elements); i++) {
		var _inst = layer_instance_get_instance(_elements[i]);
		_inst.depending_move(player.hspeed, player.vspeed);
	}
}

move_layer_instances_background = function() {

}

generate_fuel_batches = function() {
	if (irandom_range(0, 600) == 0 && instance_number(obj_fuel_batch) < 5 && player.speed > 1) {
		instance_create_layer(0, 0, "Instances", obj_fuel_batch);
	}
}

generate_lonely_pirates = function() {
	var _chance = 1500;
	var _limit = 5;
	
	if (current_stage() == stage.st2) {
		if (instance_number(obj_relay) > 0 && obj_relay.get_player_distance() < 2000) {
			_chance = 100;
		} else {
			_chance = 300;	
		}
		_limit = 15;
	}
	
	if (irandom(_chance) == 0 && instance_number(obj_pirate) < _limit) {
		_distance = irandom_range(1000, 3500);

		_min_angle = obj_player.direction - 70;
		_max_angle = obj_player.direction + 70;

		var _x = lengthdir_x(_distance, irandom_range(_min_angle, _max_angle)) + obj_player.x;
		var _y = lengthdir_y(_distance, irandom_range(_min_angle, _max_angle)) + obj_player.y;
		
		instance_create_layer(_x, _y, "Instances", obj_pirate);
	}
}

format_gametime = function(game_time) {
	var minutes = game_time div 60;
	if (minutes < 10) minutes = "0" + string(minutes);
	else minutes = string(minutes);
	
	var seconds = game_time % 60;
	if (seconds < 10) seconds = "0" + string(seconds);
	else seconds = string(seconds);
	
	return minutes + ":" + seconds;
}

session_timer_tick = function() {
	if (global.steps % room_speed == 0) session_time++;
}

draw_gui_game_time = function() {
	//if (current_stage() == stage.st2) return;
	
	var _cur_time = time * 60 + 1 - session_time;
	if (_cur_time > time * 60) _cur_time = time * 60;
	
	draw_gui_text(global.gui_width - 20, 20 - gui_offset(false), "Fallback Generator", fa_right, fa_top, 1, 1, c_white);
	draw_gui_text(global.gui_width - 20, 35 - gui_offset(false), format_gametime(_cur_time), fa_right, fa_top, 1.5, 1, c_white);
	
}