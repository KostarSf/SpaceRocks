if (!invincible) {
	instance_destroy();
	instance_create_layer(x, y, "Instances", obj_blow);

	lives -= 1;
	global.alive = false;
	
	audio_stop_sound(snd_engine);
	audio_play_sound(snd_death, 1, false);
}