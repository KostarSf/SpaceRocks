enum ship_animation_type {
	none = -1,
	game_intro = 0,
}

animation_type = ship_animation_type.game_intro;

image_angle = 90;
direction = image_angle;

image_alpha = 0;

alarm[0] = 1;

play_window_transition(obj_window_fade, fadetype.fadeout, 2);

_bg_target = instance_create_layer(0, 0, "Instances_Background", obj_point);
_bg_target.direction = 90;
_bg_target.speed = 10;

// Private variables

_anim_accell_frame = 0;
_begin_animations = false;


// Functions

get_bg_target = function() { return _bg_target; }

create_far_star_animation = function() {
	if (!instance_exists(obj_far_star_animated)) {
		instance_create_layer(0, 0, "Instances_Background", obj_far_star_animated);
	}
}

create_first_astero = function() {
	if (instance_number(obj_aster) == 0) {
		var aster = instance_create_layer(room_width / 3, -85, "Instances", obj_aster);
		aster.direction = irandom_range(250, 270);
		aster.move_speed = random_range(0.30, 0.35);
		aster.set_astero_type(astero_type.medium);
				
		var aster = instance_create_layer(room_width / 1.4, -45, "Instances", obj_aster);
		aster.direction = irandom_range(280, 290);
		aster.move_speed = random_range(0.15, 0.22);
		aster.set_astero_type(choose(astero_type.large, astero_type.medium));
				
		var aster = instance_create_layer(room_width / 2, -40, "Instances", obj_aster);
		aster.direction = irandom_range(245, 255);
		aster.move_speed = random_range(0.15, 0.25);
		aster.set_astero_type(choose(astero_type.medium, astero_type.small));
	}
}