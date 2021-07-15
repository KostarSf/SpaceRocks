draw_self();
var _dist = point_distance(x, y, room_width / 2, room_height / 2);
if (_dist < 1000) {
	draw_sprite_ext(spr_glare_1, 0, x, y - 1, _dist / 250, 1, 0, c_white, random_range(0.4, 1));
}
