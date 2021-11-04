/// @description radar update

ds_list_clear(_radar_patches);
ds_list_clear(_radar_pirates);
ds_list_clear(_radar_aster_items);
ds_list_clear(_radar_items);
ds_list_clear(_radar_energies);

_radar_patches_count = collision_circle_list(x, y, 3000, obj_fuel_batch, false, false, _radar_patches, false);
_radar_pirates_count = collision_circle_list(x, y, 3000, obj_pirate, false, false, _radar_pirates, false);
_radar_aster_items_count = collision_circle_list(x, y, 3000, obj_aster, false, false, _radar_aster_items, false);
_radar_items_count = collision_circle_list(x, y, 3000, obj_item, false, false, _radar_items, false);
_radar_energies_count = collision_circle_list(x, y, 3000, obj_energy, false, false, _radar_energies, false);

alarm[3] = 2 * room_speed;