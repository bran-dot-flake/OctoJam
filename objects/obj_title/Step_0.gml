
#region


// Timers
x_offset = lerp(x_offset, target_x_offset, .4);


#endregion


#region Select level 0 Navigation

if selected_level == 0 {
	var x_rnge		= new vec2(0, array_length(options) -1 );
	var y_rnge		= new vec2(0, array_length(options[selected_column]) -1 );

	var x_in		= ip(input.Right) - ip(input.Left);
	var y_in		= ip(input.Down) - ip(input.Up);


	#region Navigate Column (Horz.)


	// Store previous
	p_selected_column	= selected_column;
	// Update new
	selected_column	+= x_in;
	selected_column = clamp(selected_column, x_rnge.x, x_rnge.y);


	// New Selected Column; reset x_offset
	if p_selected_column != selected_column {
		
		play_sfx(global.sounds.menu_move_x);
		x_offset = 0;
		target_x_offset = width;
		selected_row = 0;
	}


	#endregion


	#region Nagivate Row (Vert.)


	// Store previous
	p_selected_row	= selected_row;
	// Update new
	selected_row	+= y_in;
	selected_row	= clamp(selected_row, y_rnge.x, y_rnge.y);


	// New Select; reset x_offset
	if p_selected_row != selected_row {
		
		play_sfx(global.sounds.menu_move_y);
		x_offset = 0;
		target_x_offset = width;
	}


	#endregion
}

#endregion

#region Select Level General (on press)


var chck = false;

if ip(input.Confirm){
	
	selected_level++;
	play_sfx(global.sounds.menu_confirm);
	
	// Tell button its selected
	if selected_level == 1 and selected_column == 1 {
		buttons[selected_row].selected = true;
		buttons[selected_row].button_timer = 2
		// button will handle deselection
		
		// Button move out
		buttons[selected_row].target_x_offset = width;
		// Label move in
		target_x_offset = 0;
	}
	
	
	
	chck = true;
}
if ip(input.Deny){
	
	play_sfx(global.sounds.menu_back);
	selected_level--;
	target_x_offset = width;
	chck = true;
}


selected_level = clamp(selected_level, 0, 1);



// Loop Column
if chck and selected_level == 1 for (var i = 0; i < array_length(options); i++) {
	
	if i != selected_column continue;
	
	// Loop Row
	for (var j = 0; j < array_length(options[i]); j++){
		
		if j != selected_row continue;
		var val = options[i, j];
		
		switch val {
			
			case "START":
				room_goto_next();
			break;
			
			case "QUIT":
				game_end();
			break;
			
			case "SCALE":
			case "MASTER":
			case "MUSIC":
			case "SFX":
			
			break;
				
		}
			
	}

}


#endregion