/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

create_particles_ext_3(x, y, 1, 0, 359, 1, 0.02, sprite_scale(), 0.05, "Instances_Background");

_player_distance = point_distance(x, y, obj_player.y, obj_player.y);

depending_move(obj_player.hspeed, obj_player.vspeed);