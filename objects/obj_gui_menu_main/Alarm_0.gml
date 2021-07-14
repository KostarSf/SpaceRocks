/// @description Create menu items

var i = 0;
var item_margin = 42;

var separator_offset = 0;

repeat (array_length(menu_item_titles)) {
	
	if (menu_item_titles[i] == "[separator]") {
		separator_offset += 31;
	} else {
		var itm = instance_create_layer(x + 23, y + 20 + i * item_margin - separator_offset, 
			"GUI", obj_gui_menu_item);
		itm.title = menu_item_titles[i];
		itm.local_id = i;
		itm.menu_parent = id;
	
		menu_item_ids[i] = itm;
	}
	
	i += 1;
}

menu_item_ids[1].item_disabled = true;
menu_item_ids[2].item_disabled = true;

height = array_length(menu_item_titles) * item_margin + 30 - separator_offset;