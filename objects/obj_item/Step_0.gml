if (speed > 1) {
	speed -= speed / 20;
} else if (speed > 0.1) {
	speed -= 0.05;
} else {
	speed = 0;
}