/// @function					format_gametime()
/// @param {real} game_time		Time in seconds
/// @description				Returns a string formatted like "mm:ss"

function format_gametime_old(game_time) {
	var minutes = game_time div 60;
	if (minutes < 10) minutes = "0" + string(minutes);
	else minutes = string(minutes);
	
	var seconds = game_time % 60;
	if (seconds < 10) seconds = "0" + string(seconds);
	else seconds = string(seconds);
	
	return minutes + ":" + seconds;
}


function format_gamescore(game_score) {
	var thous = game_score div 1000;
	var hundr = game_score % 1000;
	
	if (thous != 0) {
		if (hundr < 10) {
			hundr = "00"+string(hundr);
		} else if (hundr < 100) {
			hundr = "0"+string(hundr);
		} else {
			hundr = string(hundr);
		}
	}
	
	if (thous == 0) thous = "";
	else thous = string(thous) + " ";
	
	return string(thous) + string(hundr);
}


function draw_gui_game_time_old() {
	var _gl_ofst = global.game_gui_animated_offset;
	
	var _cur_time = 603 - global.sessionTime;
	if (_cur_time > 600) _cur_time = 600;
	
	draw_set_halign(fa_center);
	
	var c = c_dkgrey;
	draw_text_transformed_color(
		display_get_gui_width() / 2, 23 - _gl_ofst, "Fallback Generator",
		1, 1, 1, c, c, c, c, 1);
	var c = c_white;
	draw_text_transformed_color(
		display_get_gui_width() / 2, 20 - _gl_ofst, "Fallback Generator",
		1, 1, 1, c, c, c, c, 1);
	
	var c = c_dkgrey;
	draw_text_transformed_color(
		display_get_gui_width() / 2, 44 - _gl_ofst, format_gametime(_cur_time),
		2, 2, 1, c, c, c, c, 1);
	var c = c_white;
	draw_text_transformed_color(
		display_get_gui_width() / 2, 40 - _gl_ofst, format_gametime(_cur_time),
		2, 2, 1, c, c, c, c, 1);
}


function draw_gui_game_score() {
	var _gl_ofst = global.game_gui_animated_offset;
	
	draw_set_halign(fa_left);
	
	var c = c_dkgrey;
	draw_text_transformed_color(
		20, 24 - _gl_ofst, format_gamescore(score),
		2, 2, 1, c, c, c, c, 1);
	var c = c_white;
	draw_text_transformed_color(
		20, 20 - _gl_ofst, format_gamescore(score),
		2, 2, 1, c, c, c, c, 1);
	
	//draw_text(20, 20, "СЧЕТ: "+string(score));
}

function draw_gui_game_score_multiply() {
	var _gl_ofst = global.game_gui_animated_offset;
	
	draw_set_halign(fa_left);
	var _1 = string(global.score_multiply div 10);
	var _2 = string( global.score_multiply % 10);
	//draw_text(display_get_gui_width() / 2, 100, _1 + "." + _2 + "X");
	
	var c = c_dkgrey;
	draw_text_transformed_color(
		20, 64 - _gl_ofst, _1 + "." + _2 + "X",
		1.3, 1.3, 1, c, c, c, c, 1);
	var c = c_white;
	draw_text_transformed_color(
		20, 60 - _gl_ofst, _1 + "." + _2 + "X",
		1.3, 1.3, 1, c, c, c, c, 1);
}

function draw_gui_game_accuracy() {
	var _gl_ofst = global.game_gui_animated_offset;
	
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	
	var _digits = 0;
	
	var perc = floor(global.kills / global.shoots * 100);
	
	// Fuel
	if (global.fuel == 10000) perc = "100%";
	else perc = string(floor(global.fuel % 10000 / 100)) + "%";
	
	if (perc == 100) _digits = 3;
	else if (perc > 9) _digits = 2;
	else _digits = 1;
	
	//perc = string(perc);
	//perc = (perc == "NaN" ? string(0) : perc) + "%";
	

	
	var c = c_dkgrey;
	draw_text_transformed_color(
		display_get_gui_width() - 20, display_get_gui_height() - 20 + _gl_ofst, perc,
		2, 2, 1, c, c, c, c, 1);
	c = c_white;
	draw_text_transformed_color(
		display_get_gui_width() - 20, display_get_gui_height() - 23 + _gl_ofst, perc,
		2, 2, 1, c, c, c, c, 1);
		
	draw_set_valign(fa_top);
	
	var _mg = 0;
	switch (_digits) {
		case 3:
			_mg = 107;
			break;
		case 2:
			_mg = 90;
			break;
		case 1:
			_mg = 74;
			break;
	}
	
	draw_sprite_ext(spr_icon_fuel, 0, display_get_gui_width() - _mg, display_get_gui_height() - 28 - 11 + _gl_ofst, 0.7, 0.7, 0, c_dkgray, 1);
	draw_sprite_ext(spr_icon_fuel, 0, display_get_gui_width() - _mg, display_get_gui_height() - 31 - 11 + _gl_ofst, 0.7, 0.7, 0, c_white, 1);
}

function draw_gui_game_lives() {
	var _gl_ofst = global.game_gui_animated_offset;
	
	draw_set_halign(fa_right);
	
	var i = lives;
	
	repeat (lives) {
		draw_sprite_ext(spr_ship, 0, display_get_gui_width() - 10 - i * 20, 41 - _gl_ofst, 0.7, 0.7, 95, c_dkgrey, 1);
		draw_sprite_ext(spr_ship, 0, display_get_gui_width() - 10 - i * 20, 39 - _gl_ofst, 0.7, 0.7, 95, c_white, 1);
		i -= 1;
	}
}

function draw_gui_game_ammo() {
	var _gl_ofst = global.game_gui_animated_offset;
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	
	var spr_c = c_white;
	if (global.bullets == 0) {
		spr_c = c_gray;
	} else if (global.bullets <= 5) {
		spr_c = c_red;
	} else if (global.bullets >= 50) {
		spr_c = c_green;
	}
		
	var c = c_dkgrey;
	draw_text_transformed_color(
		44, display_get_gui_height() - 20 + _gl_ofst, string(global.bullets),
		2, 2, 1, c, c, c, c, 1);
	draw_text_transformed_color(
		44, display_get_gui_height() - 23 + _gl_ofst, string(global.bullets),
		2, 2, 1, spr_c, spr_c, spr_c, spr_c, 1);
	
	draw_sprite_ext(spr_icon_ammo, 0, 20, display_get_gui_height() - 28 + _gl_ofst, 1, 1, 0, c_dkgray, 1);
	draw_sprite_ext(spr_icon_ammo, 0, 20, display_get_gui_height() - 31 + _gl_ofst, 1, 1, 0, spr_c, 1);
	
	draw_set_valign(fa_top);
}


function draw_gui_game_stage() {
	var _gl_ofst = global.game_gui_animated_offset;
	
	draw_set_halign(fa_center);
	
	draw_set_color(c_white);
	draw_text(display_get_gui_width() / 2, 70 - _gl_ofst, "stage: " + string(global.game_stage));
}


function draw_gui_dev() {
	draw_set_halign(fa_right);
	
	draw_set_color(c_white);
	
	draw_text(display_get_gui_width() - 20, 80, "АСТЕР: "+string(instance_number(obj_aster)));
	draw_text(display_get_gui_width() - 20, 100, "МАКС: "+string(global.asteroMaxCount));
	draw_text(display_get_gui_width() - 20, 120, "СЛЕД. ВОЛНА: "+string(floor(alarm[0]/room_speed)));
		
	draw_text(display_get_gui_width() - 20, 150, "ПРЕДМЕТ: "+string(floor(alarm[2]/room_speed)));
			
	draw_text(display_get_gui_width() - 20, 180, "МЫШЬ: "+string(mouse_x)+" "+string(mouse_y));
	draw_text(display_get_gui_width() - 20, 200, "ДВИГАЕТСЯ: "+string(global.mouseWasMoved));
	
	
	draw_set_halign(fa_left);
	
	var ship_angle = 0;
	var ship_direction = 0;
	var ship_dir_diff = 0;
	var ship_curr_speed = 0;
			
	if (instance_exists(obj_ship)) {
		ship_angle = obj_ship.image_angle;
		ship_direction = obj_ship.direction;
		ship_dir_diff = obj_ship.direction_difference;
		ship_curr_speed = obj_ship.current_speed;
	}
			
	draw_text(20, 80, "ПОВОРОТ: "+string(ship_angle));
	draw_text(20, 100, "НАПРАВЛЕНИЕ: "+string(ship_direction));
	draw_text(20, 120, "РАЗНИЦА: "+string(ship_dir_diff));
			
	draw_text(20, 160, "СКОРОСТЬ: "+string(ship_curr_speed));
			
	draw_text(20, 180, "БЕССМЕРТИЕ: "+string(global.god_mode));
}


function draw_gui_app_version() {
	draw_set_halign(fa_right);
	draw_set_color(c_white);
	draw_text(display_get_gui_width() - 20, display_get_gui_height() - 30, global.game_version);
}


function draw_gui_window(pos_x, pos_y, width, height) {
	draw_sprite_pos(spr_gui_window_background, 0, 
		pos_x, pos_y, pos_x + width, pos_y, pos_x + width, pos_y + height, pos_x, pos_y + height, 1);
	
	draw_sprite_ext(spr_gui_window_border_corner, 0, pos_x, pos_y, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_gui_window_border_corner, 0, pos_x + width, pos_y, 1, 1, 270, c_white, 1);
	draw_sprite_ext(spr_gui_window_border_corner, 0, pos_x + width, pos_y + height, 1, 1, 180, c_white, 1);
	draw_sprite_ext(spr_gui_window_border_corner, 0, pos_x, pos_y + height, 1, 1, 90, c_white, 1);

	var bord_hlen = (width - 20) / 10;
	var bord_vlen = (height - 20) / 10;

	draw_sprite_ext(spr_gui_window_border, 0, pos_x + 10, pos_y, bord_hlen, 1, 0, c_white, 1);
	draw_sprite_ext(spr_gui_window_border, 0, pos_x + width - 10, pos_y + height, bord_hlen, 1, 180, c_white, 1);
	draw_sprite_ext(spr_gui_window_border, 0, pos_x + width, pos_y + 10, bord_vlen, 1, 270, c_white, 1);
	draw_sprite_ext(spr_gui_window_border, 0, pos_x, pos_y + height - 10, bord_vlen, 1, 90, c_white, 1);

	//instance_create_layer(pos_x + 20, pos_y + 20, "GUI", obj_gui_menu_item);
}


function draw_gui_dialog_title(width, height, text) {
	draw_set_halign(fa_center);
	
	var c = c_dkgrey;
	draw_text_transformed_color(
		width, height + 5, text,
		3, 3, 1, c, c, c, c, 1);
	var c = c_white;
	draw_text_transformed_color(
		width, height, text,
		3, 3, 1, c, c, c, c, 1);
}


/*function draw_gui_pause_menu() {
	draw_gui_window(display_get_gui_width() / 3, display_get_gui_height() / 3, display_get_gui_width() / 3, display_get_gui_height() / 3);
	draw_gui_dialog_title(display_get_gui_width() / 2, 120, "ПАУЗА");
}*/

function open_menu(menu_obj) {
	instance_create_layer(0, 0, "GUI", menu_obj);
}

function close_menu(menu_obj) {
	if (instance_exists(menu_obj)) {
		menu_obj.close();
	}
}

function draw_gui_application_borders() {
	var border_width = 2;
	
	draw_set_color(c_black);
	draw_rectangle(0, 0, display_get_gui_width(), border_width * 2, false);
	draw_rectangle(0, display_get_gui_height() - border_width * 2, display_get_gui_width(), display_get_gui_height(), false);
	draw_rectangle(0, 0, border_width * 2, display_get_gui_height(), false);
	draw_rectangle(display_get_gui_width() - border_width * 2, 0, display_get_gui_width(), display_get_gui_height(), false);
	
	draw_set_color(c_white);
	draw_rectangle(0, 0, display_get_gui_width(), border_width, false);
	draw_rectangle(0, display_get_gui_height() - border_width, display_get_gui_width(), display_get_gui_height(), false);
	draw_rectangle(0, 0, border_width, display_get_gui_height(), false);
	draw_rectangle(display_get_gui_width() - border_width, 0, display_get_gui_width(), display_get_gui_height(), false);
}