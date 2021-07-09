if (!invincible && !global.god_mode) {
	if (second_life && other.sprite_index == spr_aster_small) {
		second_life = false;
		
		var crush_direction = point_direction(other.x, other.y, x, y);
		motion_add(crush_direction, other.speed);
		
		with (other) {
			instance_destroy();
		
			//repeat (10) {
			//	instance_create_layer(x, y, "Instances", obj_debris);
			//}
			obj_game.create_debris(x, y, 10);
			
			instance_create_layer(x, y, "Instances", obj_blow);
		}
		
		audio_play_sound(snd_explode, 1, false);
		audio_play_sound(snd_hit, 1, false);
		
		effect_invincible(3);
	} else {
		var crush_direction = point_direction(x, y, other.x, other.y);
		var spd = speed;
		with (other) {
			motion_add(crush_direction, spd / mass);
		}
		
		instance_destroy();
		instance_create_layer(x, y, "Instances", obj_blow);

		lives -= 1;
		global.alive = false;
	
		audio_stop_sound(snd_engine);
		audio_play_sound(snd_death, 1, false);
	}
}