/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

draw_set_color(c_black);
draw_rectangle(0, -200, global.gui_width, 0, false);
draw_rectangle(global.gui_width, 0, global.gui_width + 200, global.gui_height, false);
draw_rectangle(0, global.gui_height, global.gui_width, global.gui_height + 200, false);
draw_rectangle(-200, 0, 0, global.gui_height, false);