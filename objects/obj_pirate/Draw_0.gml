draw_sprite_ext(spr_pirate, 0, x, y + 3, 0.94, 0.94, image_angle, c_dkgrey, image_alpha);
draw_self();
draw_engine_fire();

if (!global.dev_gui_visible) exit;

draw_set_color(c_red);
draw_set_halign(fa_center);

var _dist = _target_spotted ? purcuit_distance : spotted_distance;
draw_circle(x, y, _dist, true);

var _t = current_behavior == behavior_state.idle ? "idle" : "purcuit";
draw_text(x, y - 30, _t);
draw_text(x, y + 20, string(hitpoints));

draw_set_color(c_yellow);
draw_line(x, y, x + lengthdir_x(_target_distance, _target_angle), y + lengthdir_y(_target_distance, _target_angle))

draw_set_halign(fa_right);