///@desc Get input

#region Set inputs

var gp_left_stick		= gamepad_axis_value(gamepad, gp_axislh) < -deadzone;
var gp_right_stick		= gamepad_axis_value(gamepad, gp_axislh) >  deadzone;
var gp_up_stick			= gamepad_axis_value(gamepad, gp_axislv) < -deadzone;
var gp_down_stick		= gamepad_axis_value(gamepad, gp_axislv) >  deadzone;
var gp_stick = gp_right_stick || gp_up_stick || gp_left_stick || gp_down_stick;


// Loop through each input type
for (var i = 0; i < array_length(input_states); i++){
	
	// Loop through all types of buttons
	for (var j = 0; j < array_length(keyboard_map[i]); j++){
		
		
		
		var cur_kb_key = keyboard_map[i][j];
		var cur_gp_key = gamepad_map[i][j];
		
		
		
		// Check gamepad keys (only if the map is not blank and gamepad connected)
		if (gamepad != undefined and cur_gp_key != undefined) {
			
			// Store pressed status in array
			held	[input_check_index.gamepad, i]	= gc (gamepad, cur_gp_key);
			pressed	[input_check_index.gamepad, i]	= gcp(gamepad, cur_gp_key);
			released[input_check_index.gamepad, i]	= gcr(gamepad, cur_gp_key);
			
			
			// Set last pressed
			if held[input_check_index.gamepad, i] or pressed[input_check_index.gamepad, i] 
				or released[input_check_index.gamepad, i] or gp_stick {
				last_input = gamepad;
			}
			
			
			
			#region Gamepad pressed with stick
			
			
			// Gamepad stick pressed override
			if	(i == input.Right	and gp_right_stick){
				if gamepad_stick_pressed_timer[i] == 0 {
					pressed[input_check_index.gamepad, i] = true;
					gamepad_stick_pressed_timer[i] = gamepad_stick_pressed_time;
				}
			}
			if	(i == input.Up		and gp_up_stick){
				if gamepad_stick_pressed_timer[i] == 0 {
					pressed[input_check_index.gamepad, i] = true;
					gamepad_stick_pressed_timer[i] = gamepad_stick_pressed_time;
				}
			}
			if	(i == input.Left	and gp_left_stick){
				if gamepad_stick_pressed_timer[i] == 0 {
					pressed[input_check_index.gamepad, i] = true;
					gamepad_stick_pressed_timer[i] = gamepad_stick_pressed_time;
				}
			}
			if	(i == input.Down	and gp_down_stick){
				if gamepad_stick_pressed_timer[i] == 0 {
					pressed[input_check_index.gamepad, i] = true;
					gamepad_stick_pressed_timer[i] = gamepad_stick_pressed_time;
				}
			}
			
			
			#endregion
			
			
		}
		// Check keyboard keys (only if the map is not blank)
		if (cur_kb_key != undefined) {
			
			// Store pressed status in array
			held	[input_check_index.keyboard, i]	= kc (cur_kb_key);
			pressed	[input_check_index.keyboard, i]	= kcp(cur_kb_key);
			released[input_check_index.keyboard, i]	= kcr(cur_kb_key);
			
			
			// Set last pressed
			if held[input_check_index.keyboard, i] or pressed[input_check_index.keyboard, i]
				or released[input_check_index.keyboard, i] {
				last_input = controller.None;
			}
		}
			
	}
}

#endregion
