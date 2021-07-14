if (!instance_exists(obj_ship) || !global.draw_dev_gui) exit;

draw_set_color(c_red);
draw_line(x, y, obj_ship.x, obj_ship.y);