



function default_save_file() constructor {
	scale				= floor(display_get_height() / gh) - 1;
	mus_volume			= 1;
	sfx_volume			= 1;
	master_volume		= .6;
	fullscreen			= false;
}





function create_save_file() {
	var fle_name = global.defaults.save_file_name;
	
	if !file_exists(fle_name) {
			
		// New save constructor
		var save = new default_save_file();
		
		// Save to buffer
		var string_ = json_stringify(save);
		var buffer_ = buffer_create(string_byte_length(string_) + 1,
						buffer_fixed, 1);
		buffer_write(buffer_, buffer_string, string_);
		buffer_save(buffer_, fle_name);
		buffer_delete(buffer_);
	}
}




function save_game() {
	
	// Stringify save
	var fle_name = global.defaults.save_file_name;
	var _string = json_stringify(global.save_data);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	
	// Save to buffer
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, fle_name);
	buffer_delete(_buffer);
}



///@func load_game(save_file_name)
///@desc Same as save_game, but loading
///@arg save_file_name
function load_game(_save_file_name) {
	var _buffer = buffer_load(_save_file_name);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _load_data = json_parse(_string);
	
	return _load_data;
}