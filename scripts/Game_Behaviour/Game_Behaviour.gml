function current_stage() {
	return obj_rm_stage_1._current_stage;
}

function spawn_pirate(x, y) {
	instance_create_layer(x, y, "Instances", obj_pirate);
}

function create_aster_beyond_view() {
	var max_dim = 1500;
	
	if (choose(0,1) == 0) {
		var rnd = irandom_range(32, max_dim);
		var xx = choose(0 - rnd, room_width + rnd);
		var yy = irandom_range(-max_dim, max_dim);
	} else {
		var rnd = irandom_range(32, max_dim);
		var xx = irandom_range(-max_dim, max_dim);
		var yy = choose(0 - rnd, room_height + rnd);
	}

	instance_create_layer(xx, yy, "Instances", obj_aster);
	
}

function create_shoot_fire(parent, sprite) {
	var _fire = instance_create_layer(parent.x, parent.y, parent.layer, obj_shoot_fire);
	_fire.parent_ship = parent;
	_fire.sprite_index = sprite;
}


function create_particles(x, y, count) {
	repeat (count) {
		instance_create_layer(x, y, "Instances", obj_particle);
	}
}


function create_emote(emote_sprite, targets) {
	if (is_array(targets)) {
		var i = 0;
		repeat (array_length(targets)) {
			var emote = instance_create_layer(0, 0, "Player", obj_emote);
			emote.sprite_index = emote_sprite;
			emote.target = targets[i];
			i += 1;
		}
	} else {
		var emote = instance_create_layer(0, 0, "Player", obj_emote);
		emote.sprite_index = emote_sprite;
		emote.target = targets[i];
	}
}


function create_bg_star(x, y, target, camera) {
	var _st = instance_create_layer(x, y, "Instances_Background", obj_bg_star);
	_st.target = target;
	_st.camera = camera;
	
	return _st;
}


function create_particles_ext_3(x, y, count, angle, spread, speed, fade_speed, scale, speed_decrease, layer) {
	repeat (count) {
		var debr = instance_create_layer(x, y, layer, obj_particle);
		debr.set_move_speed(speed);
		debr.fade_speed = fade_speed;
		debr.image_xscale = scale;
		debr.image_yscale = scale;
		debr.speed_decrease = speed_decrease;
		
		spread = clamp(spread, 0, 359) / 2;
		
		var deg1 = angle - spread;
		var deg2 = angle + spread;
		
		debr.direction = irandom_range(deg1, deg2);
	}
}


function create_particles_ext_2(x, y, count, angle, spread, speed, fade_speed, scale, speed_decrease) {
	create_particles_ext_3(x, y, count, angle, spread, speed, fade_speed, scale, speed_decrease, "Instances");
}

function create_particles_ext(x, y, count, angle, spread, speed, fade_speed) {
	create_particles_ext_2(x, y, count, angle, spread, speed, fade_speed, 1, 0.01);
}


function create_star_dust(dir, speed) {
	if (irandom_range(0, 10) == 0) {
		var _dust_x = irandom_range(0, room_width);
		var _dust_y = irandom_range(0, room_height);
			
		var _dust_size = random_range(0.1, 2.1);
			
		//create_debris_ext_2(_dust_x, _dust_y, 1, 0, 360, _dust_speed, 0.004, _dust_size, 0.0001);
		
		var _dust = create_bg_star(_dust_x, _dust_y, undefined, global.camera);
		_dust.set_scale(_dust_size);
		_dust.static_speed = speed;
		_dust.static_direction = dir;
	}
}