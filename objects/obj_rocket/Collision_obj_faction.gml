/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
if (other.faction == faction) exit;

other.take_damage(damage);

audio_play_sound(snd_hit, 6, false);

create_particles_ext(x, y, irandom_range(2, 10), direction - 180, 60, random_range(0.2, 0.8), random_range(0.01, 0.04));
instance_destroy();
