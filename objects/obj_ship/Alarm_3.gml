/// @description Charge Blow

audio_stop_sound(snd_charge);
audio_play_sound(snd_boom, 2, false);
global.shoots += 50;
charging = false;
repeat (50) {
	var bullet = instance_create_layer(x, y, "Instances", obj_bullet);
	bullet.image_angle = irandom_range(0, 359);
	bullet.direction = bullet.image_angle;
	bullet.move_speed = speed + 3;
}