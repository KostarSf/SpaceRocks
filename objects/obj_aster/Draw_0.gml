if (x < -16 || x > room_width + 16 || y < - 16 || y > room_height + 16) exit;

draw_sprite_ext(sprite_index, image_index, x, y + 3, 0.94, 0.94, image_angle, c_dkgrey, image_alpha);

draw_self();

if (global.dev_gui_visible) {
	draw_set_color(c_red);
	draw_text(x - 10, y + 25, string(hitpoints));
}
