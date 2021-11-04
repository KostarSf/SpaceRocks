function gui_offset(show_in_stage_2) {
	if (!instance_exists(obj_rm_stage_1)) return 0;
	
	if (current_stage() == stage.st2 && show_in_stage_2) return 0;
	
	static current_offset = 100;
	static max_offset = 100;
	
	static offset_has_changed = false;
	static change_step = 0;
	
	if (offset_has_changed && change_step != global.steps) {
		offset_has_changed = false;
	}
	
	if (!offset_has_changed) {
		offset_has_changed = true;
		change_step = global.steps;
		
		if (current_stage() == stage.st1) {
			current_offset = clamp(current_offset - 1, 0, max_offset);
		} else {
			current_offset = clamp(current_offset + 1, 0, max_offset);
		}
	}
	
	return current_offset;
}

function draw_outline(x1, y1, x2, y2, thicknes, color) {
	if (thicknes <= 0) thicknes = 0.1;
	
	draw_set_color(color);
	draw_rectangle(x1, y1, x1 + thicknes, y2, false);
	draw_rectangle(x1, y1, x2, y1 + thicknes, false);
	draw_rectangle(x2 - thicknes, y1, x2, y2, false);
	draw_rectangle(x1, y2 - thicknes, x2, y2, false);
}

function draw_gui_text_2(x, y, text, halign, valign, size, angle, color, opacity) {
	draw_set_halign(halign);
	draw_set_valign(valign);
	var c = c_dkgrey;
	draw_text_transformed_color(x, y+2, text, size, size, angle, c, c, c, c, opacity);
	var c = color;
	draw_text_transformed_color(x, y,   text, size, size, angle, c, c, c, c, opacity);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

function draw_gui_text(x, y, text, halign, valign, size, angle, color) {
	draw_gui_text_2(x, y, text, halign, valign, size, angle, color, 1);
}

function draw_gui_icon(x, y, sprite, size, shadow_offset, rotate, color) {
	draw_sprite_ext(sprite, 0, x, y+shadow_offset, size, size, rotate, c_dkgray, 1);
	draw_sprite_ext(sprite, 0, x, y,   size, size, rotate, color, 1);
}