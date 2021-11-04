target = undefined;
camera = undefined;

image_angle = irandom_range(0, 359);
image_speed = random_range(0.5, 3);

relative_speed = random_range(0.001, 1);

fade_speed = random_range(0.0001, 0.01);
rise_speed = random_range(0.001, 0.05);
persist_duration = ceil(random_range(0.1, 2) * room_speed);

static_direction = 0;
static_speed = 0;
alarm[0] = 1;

image_xscale = random_range(0.05, 1.1);
image_yscale = image_xscale;

image_alpha = 0;

have_glare = irandom_range(0, 20) == 0;

persist_after_rooms = [rm_stage_1_intro];

_glare_switch = false;

_star_is_rising = true;
_star_is_persisting = false;
_star_is_fading = false;

set_scale = function(scale) {
	image_xscale = scale;
	image_yscale = scale;
}

get_camera_update_pos = function(coords) {
	return coords / 4 * relative_speed;
}