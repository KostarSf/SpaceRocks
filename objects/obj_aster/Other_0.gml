if (global.astero_force_despawn_out_of_room) {
	instance_destroy();
}

if (can_be_unspawn) {
	if (irandom_range(0, 2) == 0) {
		instance_destroy();
	}
}