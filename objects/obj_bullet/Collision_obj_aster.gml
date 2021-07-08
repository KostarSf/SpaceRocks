instance_destroy();

with (other) {
	instance_destroy();
	var pieces_count = irandom_range(0, 2);
	
	if (sprite_index == spr_aster_large) {
		global.bullets += choose(2, 3);
		repeat (pieces_count) {
			var aster = instance_create_layer(x, y, "Instances", obj_aster);
			aster.sprite_index = spr_aster_med;
			aster.direction = direction + irandom_range(-70, 70);
		}
	} else if (sprite_index == spr_aster_med) {
		global.bullets += choose(1, 2);
		repeat (pieces_count) {
			var aster = instance_create_layer(x, y, "Instances", obj_aster);
			aster.sprite_index = spr_aster_small;
			aster.direction = direction + irandom_range(-70, 70);
		}
	} else {
		global.bullets += 1;
	}
	
	repeat (10) {
		instance_create_layer(x, y, "Instances", obj_debris);
	}
	
	instance_create_layer(x, y, "Instances", obj_blow);
}

score += 10;
audio_play_sound(snd_explode, 1, false);
//audio_play_sound(snd_coin, 2, false);