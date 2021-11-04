/// @description check other pirates collisions

if (current_behavior == behavior_state.damaged) exit;

ds_list_clear(_nearest_pirates);
_nearest_pirates_count = collision_circle_list(x, y, 50, obj_pirate, false, true, _nearest_pirates, false);

ds_list_clear(_nearest_asteros);
_nearest_asteros_count = collision_circle_list(x, y, 100, obj_aster, false, false, _nearest_asteros, true);

alarm[2] = 0.2 * room_speed;