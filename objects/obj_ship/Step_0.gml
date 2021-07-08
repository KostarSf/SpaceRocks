// Controlls

if (keyboard_check(vk_left)) {
	image_angle += 5;
} else if (keyboard_check(vk_right)) {
	image_angle -= 5;
} 

if (keyboard_check(vk_up)) {
	if (!snd_engine_play) {
		snd_engine_play = true;
		audio_play_sound(snd_engine, 0, true);
	}
	
	if (sprite_index != spr_ship_accel) {
		sprite_index = spr_ship_accel;
	}
	
	if (speed <= 1) {
		motion_add(image_angle, 0.1);
	} else {
		motion_add(image_angle, 0.05);
	}
} else {
	snd_engine_play = false;
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

move_wrap(true, true, sprite_width / 2);

// Shooting

if (keyboard_check_pressed(ord("Z"))) {
	if (global.bullets > 0) {
		audio_play_sound(snd_shoot, 1, false);
		var bullet = instance_create_layer(x, y, "Instances", obj_bullet);
		bullet.image_angle = image_angle;
		bullet.direction = image_angle;
		bullet.speed = speed + 3;
		global.shoots += 1;
		global.bullets -= 1;
	} else {
		audio_play_sound(snd_out_of_ammo, 0, false);
	}
}

if (keyboard_check_pressed(ord("X"))) {
	if (global.bullets >= 50 && !charging) {
		charging = true;
		global.bullets -= 50;
		
		instance_create_layer(x, y, "Instances", obj_charge_splash);
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
	invincible = true;
	alarm[0] = room_speed * 3;
	alarm[1] = 1;
}

global.shipX = x;
global.shipY = y;