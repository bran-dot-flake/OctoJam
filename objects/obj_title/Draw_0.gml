

#region Positioning Temps


var font_sprite		= spr_title;
var title_y			= 64;
var ps				= new vec2(56, title_y);

var label_sep		= 10;
var label_x			= [60, 130];
var label_y			= ps.y + sprite_get_height(font_sprite) + label_sep;

var line_sep		= 4;
var str_h			= string_height("A");

var selector_sprite	= spr_selector;


var button_sprite	= spr_nineslice_button;
var button_border	= 1;
var button_x		= label_x[1] + 60;
var button_y		= label_y + label_sep + str_h - button_border;


if !initialized {
	
	// Create buttons
	for (var i = 0; i < array_length(variables); i++){
		
		// Create the button
		var inst = instance_create_depth(button_x, button_y + i * (str_h + line_sep),
					depth, obj_settings_button);
		
		
		// Give attributes
		inst.name			= variables[i,0];
		inst.type			= variables[i,1];
		inst.instance		= other;
		inst.width			= 12;
		inst.height			= button_border *2 + str_h;
		inst.sprite_index	= button_sprite;
		
		
		// Add to buttons array
		array_push(buttons, inst);
	}
	
	
	initialized = true;	
}


#endregion


#region Sprite

// Draw the name sprite
draw_sprite			(font_sprite, 0, ps.x, ps.y);

#endregion


#region Lefthand

// Draw the label
ps.x = label_x[0];
ps.y = label_y;

draw_text(ps.x, ps.y, "PLAY");

ps.y += label_sep + str_h;


// Draw the options
for (var i = 0; i < array_length(options[0]); i++) {
	
	var selct = selected_column == 0 and i == selected_row;
	var xoff = selct ? x_offset : 0;
	
	draw_text(ps.x + xoff, ps.y, options[0,i])	;
	if selct draw_sprite(selector_sprite, 0, ps.x + sprite_get_width(selector_sprite) / 2, ps.y)
	
	ps.y += line_sep + str_h;
}


#endregion


#region Righthand


ps.x = label_x[1];
ps.y = label_y;


// Draw the label
draw_text(ps.x, ps.y, "SETTINGS");
ps.y += label_sep + str_h;


// Draw the options
for (var i = 0; i < array_length(options[1]); i++) {
	
	var selct = selected_column == 1 and i == selected_row;
	var xoff = selct ? x_offset : 0;
	
	// Draw the setting name
	draw_text(ps.x + xoff, ps.y, options[1 ,i]);
	
	// Draw the selector
	if selct and selected_level <= 0 {
		draw_sprite(selector_sprite, 0, 
		ps.x + sprite_get_width(selector_sprite) / 2, ps.y);
	}


	ps.y += line_sep + str_h;
}

#endregion