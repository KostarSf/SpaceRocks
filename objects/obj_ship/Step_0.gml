if (!global.gamePaused) {

// Controlls

if (global.mouseWasMoved) {
	image_angle = point_direction(x, y, mouse_x, mouse_y)
}

if (keyboard_check(vk_left)) {
	image_angle += 5;
} else if (keyboard_check(vk_right)) {
	image_angle -= 5;
} 

speed = current_speed;

if (keyboard_check(vk_up) || mouse_check_button(mb_right)) {
	if (!accelerating) {
		accelerating = true;
		
		if (!playing_engine_sound) {
			playing_engine_sound = true;
			audio_play_sound(snd_engine, 0, true);
		}
		
	}
	
	if (speed <= 1) {
		motion_add(image_angle, 0.1);
	} else {
		motion_add(image_angle, 0.05);
	}
} else {
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
} else if (speed > 5) {
	speed = 5;
}

current_speed = speed;

// Behaviour

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
	if (global.bullets > 0) {
		audio_play_sound(snd_shoot, 1, false);
		var bullet = instance_create_layer(x, y, "Instances", obj_bullet);
		bullet.image_angle = image_angle;
		bullet.direction = image_angle;
		bullet.move_speed = speed + 3;
		global.shoots += 1;
		global.bullets -= 1;
	} else {
		audio_play_sound(snd_out_of_ammo, 0, false);
	}
}

if (keyboard_check_pressed(ord("X"))) {
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
	
}

// States

if (revind) {
	revind = false;
	effect_invincible(3);
}

// Variables

global.shipX = x;
global.shipY = y;

anim_step += 1;
if (anim_step > 127) {
	anim_step = 0;
}


// if (!global.gamePaused) {
} else {
	speed = 0;
	playing_engine_sound = false;
	audio_stop_sound(snd_engine);
}