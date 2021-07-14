if (speed > 1) {
	speed -= speed / 20;
} else if (speed > 0.55) {
	speed -= 0.05;
	_hspeed = hspeed;
	_vspeed = vspeed;
} else {
	hspeed = _hspeed - global.ship_hspeed;
	vspeed = _vspeed - global.ship_vspeed;
}