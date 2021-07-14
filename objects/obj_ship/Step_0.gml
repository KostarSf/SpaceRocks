if (!global.gamePaused) {

// Controlls

if (global.mouseWasMoved) {
	global.mouse_visible = true;
	//image_angle = point_direction(x, y, mouse_x, mouse_y);
}

if (keyboard_check(vk_left)) {
	global.mouse_visible = false;
	image_angle += 5;
} else if (keyboard_check(vk_right)) {
	global.mouse_visible = false;
	image_angle -= 5;
} 

// если мышь двинулась то активировать автонаводку на прицел и сам прицел
// если были нажаты стрелки, отлючить автонавод и прицел

if (global.mouse_visible) {
	image_angle = point_direction(x, y, mouse_x, mouse_y);
	cursor_sprite = spr_cursor_crosshair;
} else {
	cursor_sprite = -1;
}

direction_difference = angle_difference(image_angle, direction);

speed = current_speed;

if (keyboard_check(vk_up) || mouse_check_button(mb_right)) {
	global.ship_accelerating = true;
	
	if (mouse_check_button(mb_right)) {
		image_angle = point_direction(x, y, mouse_x, mouse_y);
		direction_difference = angle_difference(image_angle, direction);
	}
	
	if (!accelerating) {
		accelerating = true;
		
		fuel_remove(10, true);
		
		if (!playing_engine_sound) {
			playing_engine_sound = true;
			audio_play_sound(snd_engine, 0, true);
		}
		
		var sparkle_count = 10 - linear_interpolate_value(clamp(speed, 0, 3), 0, 3, 0, 8);
		var _x = x + lengthdir_x(10, image_angle + 180);
		var _y = y + lengthdir_y(10, image_angle + 180);
		create_debris_ext(_x, _y, sparkle_count, image_angle + 180, 45, 2, 0.05);
	}
	
	if (speed <= 1.2 && fuel_remove(15 - linear_interpolate_value(speed, 0, 1.2, 1, 15), true)) {
		motion_add(image_angle, 0.12);
	} else {
		motion_add(image_angle, 0.04);
	}
	
	var sparkle_count = 10 - linear_interpolate_value(speed, 0, 2, 0, 10);
	var _x = x + lengthdir_x(10, image_angle + 180);
	var _y = y + lengthdir_y(10, image_angle + 180);
	create_debris_ext(_x, _y, sparkle_count, image_angle + 180, 20, 2.5, 0.05);
	
	if (global.step_timer % 3 == 0) {
		fuel_remove(1, true);
	}
	
	if (abs(direction_difference) > 100 && global.fuel > 0) {
		if (global.step_timer % 5 == 0) {
			fuel_remove(linear_interpolate_value(abs(direction_difference), 100, 180, 1, 25), true);
		}
		
		var motion_count = linear_interpolate_value(abs(direction_difference), 101, 180, 0, 0.1);
		motion_add(image_angle, motion_count);
		var sparkle_count = linear_interpolate_value(abs(direction_difference), 101, 180, 0, 5);
		var _x = x + lengthdir_x(10, image_angle + 180);
		var _y = y + lengthdir_y(10, image_angle + 180);
		create_debris_ext(_x, _y, sparkle_count, image_angle + 180, 45, 2, 0.01);
	}
} else {
	global.ship_accelerating = false;
	
	accelerating = false;
	playing_engine_sound = false;
	audio_stop_sound(snd_engine);
	
	if (sprite_index != spr_ship) {
		sprite_index = spr_ship;
	}
	
	if (speed > 2) {
		speed = speed - speed / 150;
	} else if (speed < 0.1) {
		speed -= 0.005;
	} else if (speed <= 2) {
		speed = speed - speed / 300;
	} 
}

if (speed < 0) {
	speed = 0;
} else if (speed > global.ship_max_speed) {
	speed = global.ship_max_speed;
}

current_speed = speed;



x = room_width / 2;
y = room_height / 2;

global.ship_hspeed = hspeed;
global.ship_vspeed = vspeed;


// Map Border Behaviour

move_wrap(true, true, sprite_width / 2);

var force_margin = 8;
var force_strength = 0.05;

if (y < force_margin) {
	motion_add(270, force_strength);
} else if (y > room_height - force_margin) {
	motion_add(90, force_strength);
}

if (x < force_margin) {
	motion_add(0, force_strength);
} else if (x > room_width - force_margin) {
	motion_add(180, force_strength);
}

// Shooting

if (keyboard_check_pressed(ord("Z")) || mouse_check_button_pressed(mb_left)) {
	
	if (global.bullets > 0 && !shoot_delay) {
		shoot_delay = true;
		alarm[5] = room_speed / 2;
		audio_play_sound(snd_shoot, 1, false);
		var _x = x + lengthdir_x(12, image_angle);
		var _y = y + lengthdir_y(12, image_angle);
		var bullet = instance_create_layer(_x, _y, "Instances", obj_bullet);
		bullet.image_angle = image_angle;
		bullet.direction = image_angle;
		//bullet.move_speed = speed + 3;
		bullet.move_speed = speed + 3.1;
		global.shoots += 1;
		global.bullets -= 1;
		
		var gun_fire = instance_create_layer(x, y, "Instances", obj_shoot_fire);
		gun_fire.image_angle = image_angle;
		gun_fire.ship_parent = id;
	} else {
		if (!shoot_delay)
			audio_play_sound(snd_out_of_ammo, 0, false);
	}
}


if (keyboard_check_pressed(ord("X"))) {
	/*
	if (global.bullets >= 50 && !charging_delay) {
		charging_delay = true;
		charging = true;
		global.bullets -= 50;
		
		//instance_create_layer(x, y, "Instances", obj_charge_splash);
		audio_play_sound(snd_charge, 2, false);
		alarm[3] = 2 * room_speed;
		alarm[4] = 10 * room_speed;
	} else {
		audio_play_sound(snd_out_of_ammo, 0, false);
	}
	*/
	
}

if (!instance_exists(obj_fuel_vacuum) && global.alive) {
	instance_create_layer(x, y, "Instances", obj_fuel_vacuum);
}

// States

if (revind) {
	revind = false;
	effect_invincible(3);
}

if (charging) {
	if (global.step_timer % 10 == 0) {
		create_debris(x, y, irandom_range(0, 4));
	}
}

// Variables

global.shipX += hspeed;
global.shipY += vspeed;


// if (!global.gamePaused) {
} else {
	speed = 0;
	playing_engine_sound = false;
	audio_stop_sound(snd_engine);
}