sprite_index = choose(spr_item_repair);
speed = 3;
direction = irandom_range(0, 359);

//move_speed = 0.056
//move_step = 1;

//spawn_y = 0;

//alarm[0] = move_speed * room_speed;

picked_up = false;

//_offset_x = 0;
//_offset_y = 0;

depending_move = function(hmove, vmove) {
	x -= hmove;
	y -= vmove;
}