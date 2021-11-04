function start_properties() {
	score = 0;
	lives = 2;
	global.alive = true;
	global.shoots = 0;
	global.kills = 0;
	global.bullets = 10;
	global.score_multiply = 10;
	global.shipX = 0;
	global.shipY = 0;
	global.maxBullets = 999;
	global.god_mode = false;
	global.fuel = 500;

	global.ship_max_speed = 5;

	global.gamePaused = false;
	global.pause_time = -1;
	
	global.mouse_visible = true;
	
	global.game_stage = 1;
	
	global.astero_force_despawn_out_of_room = false;
	
	global.prepare_for_finish = false;
	global.start_win_delay_counter = false;

	global.bg_stars_1_x = 0;
	global.bg_stars_1_y = 0;
	global.bg_stars_2_x = 0;
	global.bg_stars_2_y = 0;
	
	global.game_gui_animated_offset = 200;
	
	global.ship_hspeed = 0;
	global.ship_vspeed = 0;
	
	global.ship_moving_mult = 1.4;
	global.ship_accelerating = false;
	
	global.item_create_chanse = 50;
}

function reset_game_timer() {
	global.sessionTime = 0;
	global.sessionStartedAt = current_time;
	global.sessionStartedAtModify = global.sessionStartedAt;
}

function respawn_player() {
	if (room != rm_game) {
		exit;
	}

	audio_play_sound(snd_revive, 2, false);
	create_debris(room_width / 2, room_height / 2, 10);

	var ship = instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_ship);
	ship.image_angle = 90;
	ship.revind = true;

	global.bullets = 10;
}


function spawn_item(x, y) {
	instance_create_layer(x, y, "Instances", obj_item);
}


function create_aster_beyond_borders() {
	if (global.game_stage == 5) return;
	
	if (choose(0,1) == 0) {
		var xx = choose(0 - 16, room_width + 16);
		var yy = irandom_range(0, room_height);
	} else {
		var xx = irandom_range(0, room_width);
		var yy = choose(0 - 16, room_height + 16);
	}

	var aster = instance_create_layer(xx, yy, "Instances", obj_aster);
	with (aster) {
		switch (global.game_stage) {
			case 2:
				motion_add(irandom_range(-20, 20), random_range(1, 5));
				speed += random_range(1, 3);
				break;
			case 3:
				motion_add(irandom_range(-30, 30), random_range(2, 12));
				speed += random_range(1, 10);
				break;
			case 4: 
				motion_add(irandom_range(-40, 40), random_range(6, 400));
				motion_add(irandom_range(-5, 5), random_range(6, 200));
				speed += random_range(1, 20);
				break;
		}
		
	}
}

function item_delay_add(delay) {
	global.item_delay += delay;

	if (global.item_delay < global.item_delay_min) {
		global.item_delay = global.item_delay_min;
	} else if (global.item_delay > global.item_delay_max) {
		global.item_delay = global.item_delay_max;
	}
}

function calculate_astero_max_count() {
	if (score <= global.maxAsteroAt) {
		global.asteroMaxCount = linear_interpolate_value(score, 0, global.maxAsteroAt, global.minAstero, global.maxAstero);
	} else {
		global.asteroMaxCount = global.maxAstero;
	}

	global.asteroMaxCount = floor(global.asteroMaxCount);
}

/*
function create_debris(x, y, count) {
	repeat (count) {
		instance_create_layer(x, y, "Instances", obj_debris);
	}
}


function create_debris_ext_2(x, y, count, angle, spread, speed, fade_speed, scale, speed_decrease) {
	repeat (count) {
		var debr = instance_create_layer(x, y, "Instances", obj_debris);
		debr.set_move_speed(speed);
		debr.fade_speed = fade_speed;
		debr.image_xscale = scale;
		debr.image_yscale = scale;
		debr.speed_decrease = speed_decrease;
		
		spread = clamp(spread, 0, 359) / 2;
		
		var deg1 = angle - spread;
		var deg2 = angle + spread;
		
		debr.direction = irandom_range(deg1, deg2);
	}
}


function create_debris_ext(x, y, count, angle, spread, speed, fade_speed) {
	create_debris_ext_2(x, y, count, angle, spread, speed, fade_speed, 1, 0.01);
}
*/

function fuel_add_old(count) {
	global.fuel += count;
	if (global.fuel > 10000) global.fuel = 10000;
}

function fuel_remove_old(count, forced) {
	count = floor(count);
	
	if (global.fuel < count && !forced) return false;
	else {
		global.fuel -= count;
	}
	
	if (global.fuel < 0) global.fuel = 0;
	return true;
}

function game_pause_toggle() {
	global.gamePaused = !global.gamePaused;
	global.pause_time = current_time;
	
	if (global.gamePaused) {
		open_menu(obj_gui_menu_pause);
	} else {
		close_menu(obj_gui_menu_pause);
	}
}


function game_restart_session() {
	instance_destroy(obj_far_star);
	instance_destroy(obj_aster);
	
	audio_stop_sound(msg_song);
	start_properties();
	room_goto(rm_game_intro);
}


function game_go_to_main_menu() {
	room_goto(rm_start);
}


function game_start_game() {
	start_properties();
	//room_goto(rm_game);
	var anim = instance_create_layer(0, 0, "Instances", obj_window_fadeout);
	anim.post_action = room_goto;
	anim.post_action_args = rm_game_intro;
}


function game_go_to_options() {
	room_goto(rm_start);
}


function game_go_to_leaderboard() {
	room_goto(rm_start);
}


function game_exit() {
	game_end();
}