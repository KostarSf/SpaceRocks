global.mouseWasMoved = point_distance(tmp_mx, tmp_my, window_mouse_get_x(), window_mouse_get_y()) > 0 ? true : false;
tmp_mx = window_mouse_get_x();
tmp_my = window_mouse_get_y();