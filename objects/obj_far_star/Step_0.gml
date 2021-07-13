speed = speed / 1.012;

if (global.step_timer % 15 == 0) {
	image_xscale -= 0.15;
	image_yscale = image_xscale;
}

if (image_xscale < 0) {
	image_alpha -= 0.008;
	if (image_alpha <= 0) {
		instance_destroy();
	}
	
	if (!_fuel_emote_created) {
		_fuel_emote_created = true;
		var emote = instance_create_layer(0, 0, "Instances", obj_emote);
		emote.sprite_index = spr_emote_out_of_fuel;
	}
}