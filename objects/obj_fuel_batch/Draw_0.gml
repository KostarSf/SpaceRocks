if (!global.dev_gui_visible || !instance_exists(obj_player)) exit;

draw_set_color(c_red);
draw_line(x, y, obj_player.x, obj_player.y);