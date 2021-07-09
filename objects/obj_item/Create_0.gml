sprite_index = choose(spr_item_bullets, spr_item_repair, spr_item_extra_live);

move_speed = 0.3;
move_step = 12;

spawn_y = 0;

alarm[0] = move_speed * room_speed;

picked_up = false;