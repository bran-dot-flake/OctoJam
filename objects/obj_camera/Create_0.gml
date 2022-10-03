

// Variables
function initialize() {
	view_width		= gw;
	view_height		= gh;
	// Scale to max - 1 by default
	var scle		= global.save_data.scale;

	view_width		*= scle;
	view_height		*= scle;

	// Center Window
	alarm[0]		= 1;

	// Resize screen
	window_set_size	(view_width, view_height);
	surface_resize	(application_surface, view_width, view_height);
}

initialize();