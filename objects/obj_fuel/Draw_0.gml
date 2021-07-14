draw_self();

if (instance_exists(obj_ship)) {
	draw_set_color(c_green);
	draw_line(x, y, obj_ship.x, obj_ship.y);
}