/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

if (irandom_range(0, 10) == 0) {
	create_particles_ext(x, y, 1, image_angle, 4, move_speed / 2, 0.02);
}
	
image_alpha -= 0.002;
	
if (image_alpha <= 0) {
	repeat (irandom_range(2, 5)) {
		create_particles_ext(x, y, 1, image_angle, 2, random_range(move_speed / 2, move_speed * 1.2), 0.01);
	}
	instance_destroy();
} else if (image_alpha < 0.3) {
	if (irandom_range(0, lin_int(image_alpha, 0, 0.3, 1, 7)) == 0) {
		create_particles_ext(x, y, 1, image_angle, 10, random_range(move_speed / 1.5, move_speed * 1.05), 0.03);
	}
}

// добавить поведение ракеты