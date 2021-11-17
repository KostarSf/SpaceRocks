/// @description Use once

event_inherited();

if (is_undefined(parent_ship)) exit;

if (true) {

	var rocket = instance_create_layer(x, y, "Instances", obj_rocket);
	rocket.set_parent_ship(parent_ship);
} else {
	audio_play_sound(snd_out_of_ammo, 6, false);
}

