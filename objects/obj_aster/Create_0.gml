can_be_unspawn = false;

rotate_direction = choose(1, -1);
rotate_speed = random_range(0.1, 1.5);

move_speed = random_range(0.4, 1.3);

mass = 1.5;

sprite_index = choose(
	spr_aster_small, spr_aster_med,
	spr_aster_large
);

image_index = irandom_range(0, image_number - 1);

switch (sprite_index) {
	case spr_aster_med:
		mass = 2.5;
		break;

	case spr_aster_large:
		mass = 4;
		break;
}

direction = irandom_range(0, 359);
image_angle = irandom_range(0, 359);

speed = move_speed;

image_alpha = 0.8;

alarm[0] = 4 * room_speed;
alarm[1] = 1;


destroy = function(spawn_smaller_asteros, give_goodies_to_player) {
	if (give_goodies_to_player) {
		/*
		if (irandom_range(0, 50) == 0) {
			spawn_item(x, y);
		}
		*/
		if (sprite_index == spr_aster_med_item) spawn_item(x, y);
		
		if (irandom_range(0, 2) == 0) {
			repeat (irandom_range(1, 6)) {
				instance_create_layer(x, y, "Instances", obj_fuel);
			}
		}
	}
	
	
	instance_destroy();
	var pieces_count = irandom_range(0, 2) * spawn_smaller_asteros;
	
	if (sprite_index == spr_aster_large) {
		score += ceil(15 * global.score_multiply / 10) * give_goodies_to_player;
		global.bullets += choose(2, 3) * give_goodies_to_player;
		repeat (pieces_count) {
			var aster = instance_create_layer(x, y, "Instances", obj_aster);
			aster.sprite_index = spr_aster_med;
			aster.direction = direction + irandom_range(-70, 70);
		}
	} else if (sprite_index == spr_aster_med) {
		score += ceil(10 * global.score_multiply / 10) * give_goodies_to_player;
		global.bullets += choose(1, 2) * give_goodies_to_player;
		repeat (pieces_count) {
			var aster = instance_create_layer(x, y, "Instances", obj_aster);
			aster.sprite_index = spr_aster_small;
			aster.direction = direction + irandom_range(-70, 70);
		}
	} else {
		score += ceil(5 * global.score_multiply / 10) * give_goodies_to_player;
		global.bullets += 1 * give_goodies_to_player;
	}
	
	create_debris(x, y, 10);
	instance_create_layer(x, y, "Instances", obj_blow);
}