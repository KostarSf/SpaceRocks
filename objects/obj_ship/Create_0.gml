revind = false;
invincible = false;
charging_delay = false;
charging = false;
accelerating = false;

second_life = true;

ship_opacity = 1;
current_speed = speed;

playing_engine_sound = false;

function effect_invincible(duration) {
	invincible = true;
	alarm[0] = room_speed * duration;
	alarm[1] = 1;
}

// Animations variables (frames per sec)

anim_step = 0;

anim_accell_speed = 6;
anim_accell_frame = 0;

anim_charge_speed = 8;
anim_charge_frame = 0;