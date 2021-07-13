

function linear_interpolate_value(val, start_1, end_1, start_2, end_2) {
	return start_2 + (end_2 - start_2) * ((val - start_1) / (end_1 - start_1));
}