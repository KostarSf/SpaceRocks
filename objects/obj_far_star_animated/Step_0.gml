speed = speed / 1.012;

if (global.steps % 15 == 0) {
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
		create_emote(spr_emote_out_of_fuel, [obj_stage_1_intro_animation, obj_player]);
	}
	
}