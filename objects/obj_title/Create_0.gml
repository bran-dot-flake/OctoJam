
options = [
	["START", "QUIT"],
	["FULSCRN", "SCALE", "MASTER", "MUSIC", "SFX"],
];


enum settings_type {
	binary,
	slider,
	multiplier,
}
global.fullscreen = false;

variables = [
	["fullscreen",		settings_type.binary	],
	["scale",			settings_type.multiplier],
	["master_volume",	settings_type.slider	],
	["mus_volume",		settings_type.slider	],
	["sfx_volume",		settings_type.slider	],
]

buttons = [];


selected_row	= 0;
p_selected_row	= 0;
selected_column = 0;
p_selected_column = 0;

selected_level	= 0;

width			= 8;
x_offset		= 0;
target_x_offset	= width;


initialized		= false;