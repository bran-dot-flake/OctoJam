
#region Methods


/// Map button to specific keys
function input_add(_button, _main_kb_map, _main_gp_map, 
					_second_kb_map = undefined, 
					_second_gp_map = undefined){
						
	// Add button to map
	keyboard_map[_button]						= [_main_kb_map, _second_kb_map];
	gamepad_map[_button]						= [_main_gp_map, _second_gp_map];
	
	// Set input array to empty
	input_states[_button][input_type.Pressed]	= input_type.None;
	input_states[_button][input_type.Held]		= input_type.None;
	input_states[_button][input_type.Released]	= input_type.None;
}


/// For Windows, 0-3 are Xinput, eg. Xbox, and 4-11 are DirectInput, eg. Playstation
function check_controller(){
	
	var pad = controller.None;
	
	// Get pad index if connected
	for (var i = 0; i < gamepad_get_device_count(); i++){
		if gamepad_is_connected(i + controller.Xbox) || gamepad_is_connected(i + controller.Playstation){
			if gamepad_is_connected(i + controller.Xbox)
				pad = i + controller.Xbox;
			else
				pad = i + controller.Playstation;
			break;
		}
	}
	
	return pad;
}


#endregion


#region Enums

// Input buttons
enum input {
	Right,
	Up,
	Left,
	Down,
	Confirm,
	Deny,
	Right_bumper,
	Left_bumper,
	Start,
	Select,
	Height,
}


// Input types
enum input_type {
	Pressed,
	Held,
	Released,
	None,	// empty: may change method of showing no inputs pressed.
}


// Self State
enum input_state {
	Allow_inputs,
	No_inputs,
}


// Controller type
enum controller {
	Xbox		= 0,
	Playstation = 4,
	None		= 12,
}


#endregion


// Variables

enum input_check_index {gamepad, keyboard}
pressed			= [[]];
released		= [[]];
held			= [[]];


keyboard_map	= [];
gamepad_map		= [];

state			= input_state.Allow_inputs;


deadzone		= 0.5;
gamepad			= check_controller();
last_input_type	= controller.None;			// gamepad is none or gamepad value


// Timers
gamepad_stick_pressed_timer = array_create(4, 0);
gamepad_stick_pressed_time	= 10;



#region Initialize


input_add(input.Right		,	ord("D"),	gp_padr		);
input_add(input.Up			,	ord("W"),	gp_padu		);
input_add(input.Left		,	ord("A"),	gp_padl		);
input_add(input.Down		,	ord("S"),	gp_padd		);
input_add(input.Confirm		,	ord("Z"),	gp_face1	);
input_add(input.Deny		,	ord("X"),	gp_face2	);
input_add(input.Right_bumper,	ord("E"),	gp_shoulderr);
input_add(input.Left_bumper	,	ord("Q"),	gp_shoulderl);
input_add(input.Start		,	undefined,	gp_start	);
input_add(input.Select		,	undefined,	gp_select	);


#endregion