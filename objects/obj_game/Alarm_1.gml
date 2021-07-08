/// @description Ship respawn

if (room != rm_game) {
	exit;
}

audio_play_sound(snd_revive, 2, false);
repeat (10) {
	instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_debris);
}

var ship = instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_ship);
ship.image_angle = 90;
ship.revind = true;

global.bullets = 10;