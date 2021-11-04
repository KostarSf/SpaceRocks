direction = irandom(359);
desired_speed = random(0.2);
speed = desired_speed;

_glares_rotate_speed = 5;
_gl1_r = 0;
_gl2_r = 0;

depending_move = function(hmove, vmove) {
	x -= hmove;
	y -= vmove;
}