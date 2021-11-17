event_inherited();

persist_after_rooms = [rm_stage_1_intro];

rotate_direction = choose(1, -1);
rotate_speed = random_range(0.1, 1.5);

move_speed = random_range(0.4, 1.3);
relative_speed = random_range(0.65, 1.1);

hitpoints = 20;
mass = 1.5;

enum astero_type {
	small,
	medium,
	large,
	
	item,
}

_astero_type = astero_type.medium;

create_astero_with_item = function() {
	if (room != rm_stage_1) return;
	
	if(_astero_type == astero_type.medium
		&& irandom_range(0, lin_int(obj_player._lives, 1, 5, 25, 70)) == 0) {
		set_astero_type(astero_type.item);
	}
	
}

set_astero_type = function(type) {
	_astero_type = type;
	
	switch (type) {
		case astero_type.small:
			sprite_index = spr_aster_small;
			hitpoints = 20;
			mass = 1.5;
			break;
	
		case astero_type.medium:
			sprite_index = spr_aster_med;
			hitpoints = 50;
			mass = 2.5;
			create_astero_with_item();
			break;

		case astero_type.large:
			sprite_index = spr_aster_large;
			hitpoints = 90;
			mass = 4;
			break;
			
		case astero_type.item:
			sprite_index = spr_aster_med_item;
			hitpoints = 30;
			mass = 2.5;
			break;
	}
	
	image_index = irandom_range(0, image_number - 1);
}

set_astero_type(irandom_range(0,2));

direction = irandom_range(0, 359);
image_angle = irandom_range(0, 359);

speed = move_speed;

image_alpha = 0.8;

alarm[1] = 1;

if (room == rm_stage_1) {
	obj_rm_stage_1.astero_count += 1;
}

depending_move = function(hmove, vmove) {
	x -= hmove * relative_speed;
	y -= vmove * relative_speed;
}



_astero_destroy = function(spawn_smaller_asteros, give_goodies_to_player) {
	
	if (give_goodies_to_player) {
		if (_astero_type == astero_type.item) spawn_item(x, y);
		
		if (irandom_range(0, 2) == 0) {
			repeat (irandom_range(1, 6)) {
				instance_create_layer(x, y, "Instances", obj_fuel);
			}
		}
	}
	
	
	var pieces_count = irandom_range(0, 2) * spawn_smaller_asteros;
	var pieces_type = astero_type.small;
	
	switch (_astero_type) {
		case astero_type.large:
			pieces_type = astero_type.medium;
			break;
		case astero_type.medium:
			pieces_type = astero_type.small;
			break;
		case astero_type.item:
			pieces_count = 0;
			break;
	}
	
	if (_astero_type != astero_type.small) {
		repeat (pieces_count) {
			var aster = instance_create_layer(x, y, "Instances", obj_aster);
			aster.set_astero_type(pieces_type);
			aster.direction = direction + irandom_range(-70, 70);
		}
	}
	
	create_particles(x, y, 10);
	instance_create_layer(x, y, "Instances", obj_blow);
	
	if (abs(abs(x) - global.camera.get_center_x()) <= global.camera.get_width() / 2 &&
		abs(abs(y) - global.camera.get_center_y()) <= global.camera.get_height() / 2) {
		audio_play_sound(snd_explode, 7, false);
	}
	
	instance_destroy();
	
	if (room == rm_stage_1) {
		obj_rm_stage_1.astero_count -= 1;
	}
}
