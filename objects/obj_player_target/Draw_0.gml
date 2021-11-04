// Dev gui

if (!global.dev_gui_visible) exit;

draw_self();
draw_sprite_ext(spr_player_target, 0, _ship_point_x, _ship_point_y, 0.6, 0.6, 0, c_red, 1); 
draw_sprite_ext(spr_player_target, 0, _mouse_point_x, _mouse_point_y, 0.5, 0.5, 0, c_blue, 1); 
