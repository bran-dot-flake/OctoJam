
//@function approach(current, target, amount)
///@arg current
///@arg target
///@arg amount
function approach(_current, _target, _amount) {
	return _current + clamp(_target - _current, -_amount, _amount);
}



///@function wrap(val, min, max)
///@arg value
///@arg minimum
///@arg maximum
function wrap(_val, _min, _max) {
	_min = min(argument1, argument2);
	_max = max(argument1, argument2);
	_val = argument0 - argument1;

	var _range = _max - _min;
	_range++;

	return _val - floor(_val / _range) * _range + _min;
}



///@function animation_end()
function animation_end()
{
	// Get Real Image Speed
	var img_spd = sprite_get_speed(sprite_index) / 60;
		
	if sign(img_spd)
	{
		// Playing forward
		return image_index >= image_number - img_spd;
	}
	else
	{
		// Playing backward
		return image_index <= 0 - img_spd;	
	}
}


function vec2(_x, _y) constructor {
	x = _x;
	y = _y;
}


function play_sfx(_sfx) {
	return audio_play_sound(_sfx, 2, 0, 
			global.save_data.master_volume * global.save_data.sfx_volume);
}