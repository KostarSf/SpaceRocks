/// @description On 0HP
event_inherited();

instance_destroy();

create_particles(x, y, 10);
create_particles_ext_2(x, y, 10, direction, 90, speed * 0.5, 0.02, 1.5, 0.02);

repeat (irandom_range(5, 15)) {
	instance_create_layer(x, y, "Instances", obj_fuel);
}

audio_play_sound(snd_explode, 6, false);


var _en = instance_create_layer(x, y, "Instances", obj_energy);
_en.speed = speed;
_en.direction = direction;