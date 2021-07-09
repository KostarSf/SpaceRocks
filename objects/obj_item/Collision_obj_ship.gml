if (!picked_up) {
	picked_up = true;

	audio_play_sound(snd_coin, 2, false);

	switch (sprite_index) {
		case spr_item_bullets:
			global.bullets += 10;
			obj_game.item_delay_add(5);
			break;
			
		case spr_item_repair:
			other.second_life = true;
			other.effect_invincible(3);
			obj_game.item_delay_add(15);
			break;
			
		case spr_item_extra_live:
			lives = lives < 5 ? lives + 1: 5;
			obj_game.item_delay_add(25);
			break;
	}

	//repeat (10) {
	//	instance_create_layer(x, y, "Instances", obj_debris);
	//}
	obj_game.create_debris(x, y, 10);
	
	sprite_index = spr_item_pickup;
}