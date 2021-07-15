/// @description create astero with item

if (sprite_index == spr_aster_med 
	&& irandom_range(0, global.item_create_chanse) == 0) {
	sprite_index = spr_aster_med_item;
}