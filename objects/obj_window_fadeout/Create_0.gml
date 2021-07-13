post_action = undefined;
post_action_args = [];

_anim_step = 0;
_anim_delay = room_speed / 1.5;
_anim_start = false;
_anim_done = false;

_stripe_count = 126;

show_debug_message("Animation started");

alarm[1] = _anim_delay;