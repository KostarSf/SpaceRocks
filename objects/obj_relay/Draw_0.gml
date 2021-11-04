draw_sprite_ext(spr_relay, 0, x, y, sprite_scale(), sprite_scale(), 0, c_white, image_alpha);

draw_self();

draw_sprite_ext(spr_glare_1, 0, x, y, sprite_scale() *5, sprite_scale(), 0, c_white, random_range(0, 0.3));