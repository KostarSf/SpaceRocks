draw_power_line();
draw_fuel_count();
draw_lives();
draw_gui_energy();

// Dev gui

if (!global.dev_gui_visible) exit;

draw_set_color(c_red);
draw_set_halign(fa_right);

draw_text(global.gui_width - 20, 20, "mouse_moved: "+string(global.mouse_moved));
draw_text(global.gui_width - 20, 40, "mouse cntrl: "+string(mouse_control));

draw_text(global.gui_width - 20, 80, "speed: "+string(speed));