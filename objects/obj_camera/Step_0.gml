

// Fullscreen
if global.save_data.fullscreen != window_get_fullscreen() {
	window_set_fullscreen(global.save_data.fullscreen);
}

// Re-scale
if global.save_data.scale * gw != window_get_width() {
	//initialize();
}