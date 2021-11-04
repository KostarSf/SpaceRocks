draw_window_borders();


// Dev gui

if (!global.dev_gui_visible) exit;

draw_set_color(c_red);

draw_set_halign(fa_center);
draw_text(global.gui_width / 2, 20, "FPS: "+string(fps));
draw_text(global.gui_width / 2, 40, "("+string(fps_real)+")");

draw_set_halign(fa_left);
draw_text(20, 20, "X: "+string(camera_x)+" Y: "+string(camera_y));
draw_text(20, 40, "Xc: "+string(change_x)+" Yc: "+string(change_y));

draw_text(20, 80, "stars: "+string(instance_number(obj_bg_star)));