
global.defaults = {
	mus_overworld	: noone,
	mus_title		: noone,
	mus_gameover	: noone,
	mus_gamewin		: noone,
		
	font			: undefined,
	title			: "pumpkeye",
		
	save_file_name	: "",
	
	pal				: [make_color_rgb(247, 146, 30)]
}


global.sounds = {
	menu_confirm	: _5_Menu_Screen_Slide_SFX_01,
	menu_back		: _5_Menu_Screen_Slide_SFX_04,
	menu_move_x		: _5_Menu_Screen_Slide_SFX_03,
	menu_move_y		: _5_Menu_Screen_Slide_SFX_01,
	menu_slide		: _5_Menu_Screen_Slide_SFX_01,

}



global.defaults.save_file_name	= string(global.defaults.title) + "_preferences" + ".sav"
global.save_data				= "";


var fnt_spr						= spr_fnt_placeholder;
var fnt_map						= "ABCDEFGHIJKLMNOPQRSTUVWXYZ!?. "
global.defaults.font			= font_add_sprite_ext(fnt_spr, fnt_map, 1, 1);
draw_set_font					(global.defaults.font);