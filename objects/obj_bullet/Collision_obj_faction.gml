if (other.faction == faction) exit;

other.take_damage(damage);

if (other == obj_player) {
	
}

create_particles_ext(x, y, irandom_range(2, 10), direction - 180, 60, random_range(0.2, 0.8), random_range(0.01, 0.04));
instance_destroy();
