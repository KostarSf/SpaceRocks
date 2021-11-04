draw_self();

function get_alpha() {
	
	if (global.steps % floor(image_speed * 30) == 0) {
		_glare_switch = !_glare_switch;
	}
	
	if (_glare_switch) return image_alpha / 3;
	else return image_alpha / 1.2;
}

if (have_glare) {
	var _alpha = get_alpha();
	draw_sprite_ext(spr_glare_1, 0, x, y, relative_speed, image_xscale / 3, 0, c_white, _alpha);
	draw_sprite_ext(spr_glare_1, 0, x, y, relative_speed / 1.2, image_xscale / 3, 90, c_white, _alpha);
}