if (_show_help) {
	if (_current_stage == stage.st1){
		
		draw_sprite(spr_help_screen, 0, 0, 0);
		draw_gui_text(global.gui_width / 2, global.gui_height / 1.4, "Fill up the energy", fa_center, fa_top, 1, 0, c_yellow);
		draw_gui_text(global.gui_width / 2, global.gui_height / 1.33, "to start the main engine", fa_center, fa_top, 1, 0, c_yellow);
	}
	else {
		draw_gui_text(global.gui_width / 2, global.gui_height / 4.2, "GET TO THE RELAY", fa_center, fa_top, 1.5, 0, c_white);
		draw_gui_text(global.gui_width / 2, global.gui_height / 3.5, "Check your radar", fa_center, fa_top, 1, 0, c_white);
		
		draw_gui_text(global.gui_width / 2, global.gui_height / 1.4, "You've started the main engine", fa_center, fa_top, 1, 0, c_white);
		draw_gui_text(global.gui_width / 2, global.gui_height / 1.3, "Now only power is consumed", fa_center, fa_top, 1, 0, c_white);
	}
	
}

draw_gui_game_time();

if (!global.dev_gui_visible) exit;

draw_set_color(c_red);
draw_set_halign(fa_right);

draw_text(global.gui_width - 20, global.gui_height - 20, "asteros: "+string(astero_count));

draw_set_halign(fa_left);