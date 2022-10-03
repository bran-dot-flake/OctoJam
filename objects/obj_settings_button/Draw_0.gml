

// Draw self	
switch type {
	
	case settings_type.binary:
		
		// Get On/Off
		var val = global.save_data[$ name];
		var str = val ? "ON" : "OFF";
		var xx = x + x_offset;
		
		// Draw self
		draw_sprite_ext(sprite_index, 0, xx, y, 
			(string_width(str) + 2) / sprite_width, height / sprite_height, 
			0, c_white, 1);
	
		// Draw On/Off
		draw_text_transformed_color(xx + 1, y + 1, str, 1, 1, 0, 
		c_black, c_black, c_black, c_black, 1);
		
	

		// Draw the selector
		if selected {
			draw_sprite(spr_selector, 0, 
			x + sprite_get_width(spr_selector) / 2, y + 1);
		}
	break;
	
	
	
	case settings_type.multiplier:
	
		// Get Mutiplier
		var val = global.save_data[$ name];
		var str = string(val) + " X";
		
		// Draw self
		draw_sprite_ext(sprite_index, 0, x + x_offset, y, 
				(string_width(str) + 2) / sprite_width, height / sprite_height, 
				0, c_white, 1);
				
				
		// Draw the Multiplier
		draw_text_transformed_color(x + 1 + x_offset, y + 1, str, 1, 1, 0, 
		c_black, c_black, c_black, c_black, 1);
				
	break;
	
	
	
	case settings_type.slider:
	
		// Get Mutiplier
		var val = global.save_data[$ name];
		var brs	= count;
		var br_w	= 5;
		var br_sep	= 1;
		
		// Draw self
		draw_sprite_ext(sprite_index, 0, x + x_offset, y, 
				(brs * br_w + (brs - 1) * br_sep + 2) / sprite_width,
				height / sprite_height, 0, c_white, 1);
				
				
		// Draw the Bars
		var c;
		var xx = x + 1 + x_offset;
		var yy = y + 1;
		
		for (var i = 0; i < brs; i++) {

			c = (val > (1 / count) * i) ? global.defaults.pal[0] : c_black;

			draw_rectangle_color(xx, yy, xx + br_w - 1, yy + height - 3,
			c, c, c, c, 0);
			
			xx += br_w + br_sep;
		}
				
	break;


}