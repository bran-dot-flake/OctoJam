
gamepad = check_controller();


// Gamepad stick pressed buffer
for (var i = input.Right; i <= input.Down; i++) {
	gamepad_stick_pressed_timer[i] = approach(gamepad_stick_pressed_timer[i], 0, 1);
}

event_user(state);