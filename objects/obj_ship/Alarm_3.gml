/// @description Charge Blow

audio_play_sound(snd_boom, 2, false);
global.shoots += 50;
repeat (50) {
	var bullet = instance_create_layer(x, y, "Instances", obj_bullet);
	bullet.image_angle = irandom_range(0, 359);
	bullet.direction = bullet.image_angle;
	bullet.speed = speed + 3;
}