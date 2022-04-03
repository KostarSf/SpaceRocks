event_inherited();

static_x = room_width / 2;
static_y = room_height / 2;

max_speed = 5;

mouse_control = false;

image_angle = 90;
direction = 90;

camera_target = instance_create_layer(static_x, static_y, "Player", obj_player_target);
global.camera.set_target(camera_target, true);

instance_create_layer(static_x, static_y, "Player", obj_fuel_vacuum);

var _def_weapon = instance_create_layer(static_x, static_y, "Player", obj_weapon_default);
_def_weapon.parent_ship = id;
var _def_shield = instance_create_layer(static_x, static_y, "Player", obj_weapon_shield);
_def_shield.parent_ship = id;

primary_slot = _def_weapon;
secondary_slot = _def_shield;

is_shield_active = false;

// Private variables

_draw_engine_fire = false;

_fuel = 500;

_energy = 0;

_power = 100;
_ship_drifting = 0;

_emitting_debris = 0;

_lives = 2;
_invincible = false;

_show_radar = false;
_radar_pirates = ds_list_create();
_radar_pirates_count = 0;
_radar_patches = ds_list_create();
_radar_patches_count = 0;
_radar_aster_items = ds_list_create();
_radar_aster_items_count = 0;
_radar_items = ds_list_create();
_radar_items_count = 0;
_radar_energies = ds_list_create();
_radar_energies_count = 0;

_show_relay_on_map = false;
_radar_button = false;

alarm[3] = 1;

// Functions

energy_add = function(amount) {
	if (current_stage() == stage.st2) {
		power_add(amount);
	}
	
	_energy += amount;
	if (_energy > 10000) {
		_energy = 10000;
		// win game or somethin
	}
}

energy_use = function(amount) {
	if (current_stage() == stage.st2) return true;
	
	_energy -= amount;
	if (_energy < 0) {
		_energy = 0;
		return false;
	}
	
	return true;
}

find_relay = function() {
	_show_relay_on_map = true;
}

draw_relay_sprite = function(x, y, size, blend) {
	static _frame = 0;
	static _frame_changed = false;
	
	if (global.steps % 8 == 0) {
		if (!_frame_changed) {
			_frame++;
			_frame_changed = true;
		}
	} else {
		_frame_changed = false;
	}
	
	draw_sprite_ext(spr_radar_relay, _frame, x, y, size, size, 0, blend, 1);
}

draw_radar = function() {
	if (!_show_radar) return;

	draw_sprite(spr_radar_grid, 0, x, y);

	var _min_d = 30;
	var _max_d = 120;
	
	for (var i = 0; i < _radar_patches_count; i++) {
		var _obj = _radar_patches[| i];
		if (!instance_exists(_obj)) continue;
		
		var _dist = lin_int(distance_to_object(_obj), 0, 2000, _min_d, _max_d);
		
		var _x = x + lengthdir_x(_dist, point_direction(x, y, _obj.x, _obj.y));
		var _y = y + lengthdir_y(_dist, point_direction(x, y, _obj.x, _obj.y));
		
		draw_sprite_ext(spr_radar_batch, 0, _x, _y + 2, 0.94, 0.94, 0, c_dkgrey, 1);
		draw_sprite(spr_radar_batch, 0, _x, _y);
	}
	
	for (var i = 0; i < _radar_pirates_count; i++) {
		
		var _obj = _radar_pirates[| i];
		if (!instance_exists(_obj)) continue;
		
		var _dist = lin_int(distance_to_object(_obj), 0, 2000, _min_d, _max_d);
		
		var _x = x + lengthdir_x(_dist, point_direction(x, y, _obj.x, _obj.y));
		var _y = y + lengthdir_y(_dist, point_direction(x, y, _obj.x, _obj.y));
		
		draw_sprite_ext(spr_radar_pirate, 0, _x, _y + 2, 0.94, 0.94, 0, c_dkgrey, 1);
		draw_sprite(spr_radar_pirate, 0, _x, _y);
	}
	
	for (var i = 0; i < _radar_energies_count; i++) {
		
		var _obj = _radar_energies[| i];
		if (!instance_exists(_obj)) continue;
		
		var _dist = lin_int(distance_to_object(_obj), 0, 2000, _min_d, _max_d);
		
		var _x = x + lengthdir_x(_dist, point_direction(x, y, _obj.x, _obj.y));
		var _y = y + lengthdir_y(_dist, point_direction(x, y, _obj.x, _obj.y));
		
		draw_sprite_ext(spr_radar_energy, 0, _x, _y + 2, 0.94, 0.94, 0, c_dkgrey, 1);
		draw_sprite(spr_radar_energy, 0, _x, _y);
	}
	
	for (var i = 0; i < _radar_aster_items_count; i++) {
		
		var _obj = _radar_aster_items[| i];
		if (!instance_exists(_obj)) continue;
		if (_obj._astero_type != astero_type.item) continue;
		
		var _dist = lin_int(distance_to_object(_obj), 0, 2000, _min_d, _max_d);
		
		var _x = x + lengthdir_x(_dist, point_direction(x, y, _obj.x, _obj.y));
		var _y = y + lengthdir_y(_dist, point_direction(x, y, _obj.x, _obj.y));
		
		draw_sprite_ext(spr_radar_item, 0, _x, _y + 2, 0.94, 0.94, 0, c_dkgrey, 1);
		draw_sprite(spr_radar_item, 0, _x, _y);
	}
	
	for (var i = 0; i < _radar_items_count; i++) {
		
		var _obj = _radar_items[| i];
		if (!instance_exists(_obj)) continue;
		
		var _dist = lin_int(distance_to_object(_obj), 0, 2000, _min_d, _max_d);
		
		var _x = x + lengthdir_x(_dist, point_direction(x, y, _obj.x, _obj.y));
		var _y = y + lengthdir_y(_dist, point_direction(x, y, _obj.x, _obj.y));
		
		draw_sprite_ext(spr_radar_item, 0, _x, _y + 2, 0.94, 0.94, 0, c_dkgrey, 1);
		draw_sprite(spr_radar_item, 0, _x, _y);
	}
	
	
	if (_show_relay_on_map) {
		var _obj = instance_find(obj_relay, 0);
		if (!instance_exists(_obj)) return;
		
		var _dist = lin_int(distance_to_object(_obj), 0, 5000, _min_d, _max_d + 40);
		
		var _x = x + lengthdir_x(_dist, point_direction(x, y, _obj.x, _obj.y));
		var _y = y + lengthdir_y(_dist, point_direction(x, y, _obj.x, _obj.y));
		
		draw_relay_sprite(_x, _y+2, 1.90, c_dkgray);
		draw_relay_sprite(_x, _y, 2, c_white);
	}
}

draw_engine_fire = function() {
	static anim_accell_frame = 0;
	
	if (_draw_engine_fire && has_fuel()) {
		draw_sprite_ext(spr_ship_accel, anim_accell_frame, x, y, 1, 1, image_angle, c_white, 1);
		if (global.steps % 10 == 0) {
			anim_accell_frame += 1;
		}
	}
}

is_alive = function() {
	return _lives > 0;
}

lives_increase = function() {
	if (_lives < 5) {
		_lives++;
	}
	
	if (_lives > 1) {
		image_index = 0;
	}
}

lives_decrease = function() {
	
	if (current_stage() == stage.st2 && _power >= 1) return;
	
	if (_invincible) return;
	else {
		_invincible = true;
		alarm[0] = room_speed * 1;
	
	}
	
	add_emit_debris(30);
	
	if (_lives > 2) {
		instance_create_layer(x, y, "Player", obj_using_repair);
	}
	
	_lives--;
	
	if (_lives == 1) {
		image_index = 1;
	}
	
	var expl = instance_create_layer(x, y, "Instances", obj_blow);
	
	if (_lives <= 0) {
		_lives = 0;
		
		audio_play_sound(snd_death, 5, false); 
		
		cursor_sprite = -1;
		create_particles(x, y, 20);
		
		alarm[1] = 1*room_speed;
		alarm[2] = 3*room_speed;
	} else {
		expl.parent_object = id;
		audio_play_sound(snd_hit, 5, false);
	}
	
	
	
	
}

draw_lives = function() {
	if (_lives > 2) {
		var spr_count = _lives - 2;
		
		for (var i = 0; i < spr_count; i++) {
			draw_gui_icon(60 + i * 25, global.gui_height - 30, spr_icon_repair, 1, 2, 45, c_white);
		}
	}
}

fuel_add = function(quantity) {
	if (current_stage() == stage.st2) {
		power_add(quantity / 10);
	}
	
	_fuel += quantity;
	if (_fuel > 10000) _fuel = 10000;
}

fuel_use = function(quantity) {
	if (current_stage() == stage.st2) {
		power_use(quantity, true);
		return _power >= 1;
	}
	
	_fuel -= quantity;
	
	if (_fuel < 0) {
		_fuel = 0;
		return false;
	} else {
		return true;
	}
}

has_fuel = function() {
	return _fuel > 0;
}

set_emit_debris = function(ticks) {
	_emitting_debris = ticks;
}

add_emit_debris = function(ticks) {
	_emitting_debris += ticks;
}

emit_debris = function() {
	if (_lives == 0) return;
	
	if (_emitting_debris <= 0) return;
	if (_emitting_debris > room_speed * 3) _emitting_debris = room_speed * 3;
	
	if (irandom_range(0, 7) == 0) {
		create_particles_ext_2(x, y, irandom_range(1, 2), 0, 360, random_range(0.3, 0.7), 0.01, random_range(1.2, 1.7), 0.04);
	}
	_emitting_debris--;
}

update_is_shield_active = function() {
	is_shield_active = secondary_slot == obj_weapon_shield && secondary_slot.is_active();
}

spawn_speed_dust = function() {
	if (speed > 1.5) {
		if (irandom_range(0, lin_int(speed, 1.5, 5, 50, 15)) == 0) {
			var _ofst = 64;
			var _p_x = irandom_range(x - _ofst, x + _ofst);
			var _p_y = irandom_range(y - _ofst, y + _ofst);
			create_particles_ext_2(_p_x, _p_y, 1, direction - 180, 0, 0, 0.01, 0.7, 0);
		}
	}
}

power_auto_charge = function() {
	if (_power >= 100) return;
	
	_power += lin_int(_power, 0, 100, 0.3, 2);
	
	if (_power > 100) _power = 100;
}

power_add = function(amount) {
	_power += amount;
	if (_power > 500) _power = 500;
}

power_use = function(amount, can_be_partional) {
	if (_power <= 0) return 0;
	if (!can_be_partional && _power - amount < 0) return 0;
	
	_power -= amount;
	if (_power < -50) _power = -50;
	if (_power >= 0) {
		return 1;
	} else {
		return lerp(0, amount, amount + _power) / 100;
	}
}

draw_power_line = function() {
	var bg_offset = 1;
	var x_offset = 20  - gui_offset(true);
	var y_offset = 20;
	var outline_thickness = 0.5;
	var outline_margin = 4;
	var line_width = 10;
	var line_max_heigth = 100;
	
	var line_height = clamp(_power, 0, 100);
	
	var border_color = _power <= 0 ? c_red : c_white;
	
	var outline_x1 = x_offset;
	var outline_y1 = global.gui_height - y_offset - outline_thickness*2 - outline_margin*2 - line_max_heigth;
	var outline_x2 = x_offset + outline_thickness*2 + outline_margin*2 + line_width;
	var outline_y2 = global.gui_height - y_offset;
	
	var line_x1 = x_offset + outline_thickness + outline_margin;
	var line_y1 = global.gui_height - y_offset - outline_thickness - outline_margin - line_height;
	var line_x2 = x_offset + outline_thickness + outline_margin + line_width;
	var line_y2 = global.gui_height - y_offset - outline_thickness - outline_margin;
	
	draw_sprite_pos(spr_gui_window_background, 0, 
		outline_x1 - bg_offset, outline_y1 - bg_offset, 
		outline_x2 + bg_offset, outline_y1 - bg_offset, 
		outline_x2 + bg_offset, outline_y2 + bg_offset,
		outline_x1 - bg_offset, outline_y2 + bg_offset, 0.92);
	draw_outline(outline_x1, outline_y1, outline_x2, outline_y2, outline_thickness, border_color);
	
	draw_set_color(_power > 100 ? c_aqua : c_white);
	
	draw_rectangle(line_x1, line_y1, line_x2, line_y2, false);
	
	var _ic_x = outline_x1 + (outline_x2 - outline_x1) / 2;
	var _ic_y = outline_y1 - 2;
	
	draw_gui_icon(_ic_x, _ic_y, spr_icon_power, 1, 2, 0, c_white);
}


draw_fuel_count = function() {
	//if (current_stage() == stage.st2) return;
	
	var perc;
	if (_fuel == 10000) perc = 100;
	else perc = ceil(_fuel % 10000 / 100);
	
	var _color = c_white;
	if (perc == 0) _color = c_gray;
	else if (perc <= 10) _color = c_red;
	
	 if (_draw_engine_fire && perc > 0) {
		_color = sin(global.steps / 4) > 0 ? _color : c_yellow;
	}
	
	var _alpha = 1;
	if (perc == 0) {
		_alpha = sin(global.steps / 8) > 0 ? 0 : 1;
	}
	
	perc = string(perc)+"%";
	
	
	draw_gui_text_2(global.gui_width - 20 + gui_offset(false), global.gui_height - 10, perc, fa_right, fa_bottom, 2, 1, _color, _alpha);
	draw_gui_icon(global.gui_width - 20 + gui_offset(false) - (string_length(perc) * 22 * 0.9), global.gui_height - 18, spr_icon_fuel, 1, 2, 0, c_white);
}

correct_position = function() {
	x = static_x;
	y = static_y;
}

update_camera_scale = function() {
	if (speed < 6) {
		global.camera.set_scale(lin_int(speed, 1, 5, 1, 1.1));
	} else {
		global.camera.set_scale(lin_int(speed, 6, 50, 1.1, 1.2));
	}
	
}

ship_to_cursor_direction = function() {
	return point_direction(x, y, mouse_x, mouse_y);
}

ship_to_cursor_distance = function() {
	return point_distance(x, y, mouse_x, mouse_y);
}

accelerate_camera_shaking = function() {
	if (speed > 10) {
		global.camera.add_shake(0.11, lin_int(speed, 10, 50, 1, 3));
	} else if (speed < 4) {
		global.camera.set_shake(lin_int(speed, 0, 4, 1.1, 0.4));
	} else {
		global.camera.set_shake(0.4);
	}
}

draw_gui_energy = function() {
	static current_value = 0;
	
	//if (current_stage() == stage.st2) return;
	
	var _perc = ceil(_energy / 100);
	
	var _color = c_white;
	if (_perc == 0) _color = c_gray;
	else if (_show_radar) _color = c_yellow;
	
	draw_gui_text(20, 20 - gui_offset(false), "Engine energy", fa_left, fa_top, 1, 1, c_white);
	//draw_gui_text( 20, 35, string(_perc)+"%", fa_left, fa_top, 1.5, 1, _color);
	
	var _width = 115;
	var _height = 12;
	
	var _x = 20;
	var _y = 42 - gui_offset(false);
	
	//draw_outline(_x, _y + 2, _x + _width, _y + 2 + _height, 1, c_dkgray);
	//draw_outline(_x, _y, _x + _width, _y + _height, 1, c_white);
	
	draw_sprite_ext(spr_gui_energy_line, 0, _x, _y + 2, 1, 1, 0, c_dkgray, 1);
	
	var _line_width = lin_int(_energy, 0, 10000, 0, _width - 7);
	
	var line_color = c_white;
	
	if (abs(current_value - _line_width) > 0.05) {
		current_value += (_line_width - current_value) / 4;
		line_color = sign(current_value - _line_width) < 0 ? c_aqua : c_yellow;
	}
	
	draw_sprite_ext(spr_gui_energy_line, 0, _x, _y, 1, 1, 0, c_white, 1);
	
	if (_energy == 0) {
		draw_outline(_x, _y, _x + _width - 1, _y + _height, 1, c_gray);
	} else {
		draw_set_color(line_color);
		draw_rectangle(_x + 3, _y + 3, _x + 3 + current_value, _y + _height - 3, false);
	}
	
	
	if (_radar_button && !_show_radar) {
		draw_outline(_x, _y, _x + _width - 1, _y + _height, 1, c_red);
	}
	
	draw_gui_icon(_x + _width + 2, _y + _height / 2, spr_icon_energy, 1, 2, 0, c_white);
}