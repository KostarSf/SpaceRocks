/// @description On take damake
event_inherited();

direction += irandom_range(5, 25) * choose(1, -1);
speed -= speed * lin_int(get_taken_damage(), 0, 50, 0, 0.1);

var bl = instance_create_layer(x, y, "Instances", obj_blow);
bl.parent_object = id;

current_behavior = behavior_state.hit;
alarm[1] = 1 * room_speed;