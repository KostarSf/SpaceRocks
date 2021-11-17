function is_first_start() {
	return obj_controller._first_start;
}

function object_in_list(object, list) {
	var _object_in_list = false;
	
	if (is_array(list)) {
		for (var i = 0; i < array_length(list); i++) {
			if (object == list[i]) _object_in_list = true;
		}
	} else {
		if (object == list) _object_in_list = true;
	}
	
	return _object_in_list;
}

function stop_window_transition() {
	if (!is_undefined(global.current_window_transition)) {
		instance_destroy(global.current_window_transition);
	}
}

function play_window_transition(transition_object, type, duration) {
	stop_window_transition();
	
	var _trans = instance_create_layer(0, 0, "GUI", transition_object);
	_trans.transition_type = type;
	_trans.transition_duration = duration;
	
	global.current_window_transition = _trans;
}

function update_bg_stars(target) {
	static stars_1_x = 0;
	static stars_1_y = 0;
	static stars_2_x = 0;
	static stars_2_y = 0;
	
	static stars_1 = layer_get_id("Stars_1");
	static stars_2 = layer_get_id("Stars_2");
	
	static current_room = room;
	
	stars_1_x -= target.hspeed / 40;
	stars_1_y -= target.vspeed / 40;
	
	stars_2_x -= target.hspeed / 20;
	stars_2_y -= target.vspeed / 20;
	
	if (current_room != room) {
		current_room = room;
		
		stars_1 = layer_get_id("Stars_1");
		stars_2 = layer_get_id("Stars_2");
		
		stars_1_x += global.camera.camera_x;
		stars_1_y += global.camera.camera_y;
		stars_2_x += global.camera.camera_x;
		stars_2_y += global.camera.camera_y;
	}
	
	layer_x(stars_1, stars_1_x);
	layer_y(stars_1, stars_1_y);
	
	layer_x(stars_2, stars_2_x);
	layer_y(stars_2, stars_2_y);
}

function add_dynamic_stars(target) {
	if (instance_number(obj_bg_star) >= 150) return;
	
	if (irandom_range(0, 10) == 0) {
		var _star_x = irandom_range(global.camera.camera_x - 10, global.camera.camera_x + global.camera.get_width() + 10);
		var _star_y = irandom_range(global.camera.camera_y - 10, global.camera.camera_y + global.camera.get_height() + 10);
			
		var _star_speed = random_range(0, 0.02);
		var _star_size = random_range(0.05, 1.2);
		var _star_fade = random_range(0.005, 0.0005);
		
		var _st = create_bg_star(_star_x, _star_y, target, global.camera);
		_st.relative_speed = _star_speed;
		_st.set_scale(_star_size);
		_st.fade_speed = _star_fade;
	}
	
	if (irandom_range(0, 3) == 0) {
		var _star_x = irandom_range(global.camera.camera_x - 10, global.camera.camera_x + global.camera.get_width() + 10);
		var _star_y = irandom_range(global.camera.camera_y - 10, global.camera.camera_y + global.camera.get_height() + 10);
			
		create_bg_star(_star_x, _star_y, target, global.camera);
	}
}

function lin_int(val, start_1, end_1, start_2, end_2) {
	val = clamp(val, start_1, end_1);
	var turn_around = start_2 > end_2;
	
	if (!turn_around) {
		return start_2 + (end_2 - start_2) * ((val - start_1) / (end_1 - start_1));
	} else {
		return (start_2 + end_2) - (end_2 + (start_2 - end_2) * ((val - start_1) / (end_1 - start_1)));
	}
}

function music_add_to_queue(music, loop) {
	obj_controller._music_add_to_queue(music, loop);
}

function music_skip_current() {
	obj_controller._music_skip_current();
}

function music_clear_queue() {
	obj_controller._music_clear_queue();
}
