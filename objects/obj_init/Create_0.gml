
// temp
if file_exists(global.defaults.save_file_name) file_delete(global.defaults.save_file_name)


// Make save file if not already made
create_save_file();


// Load Save file ; Set var to save file
global.save_data = load_game(global.defaults.save_file_name);


// Go to next; title
room_goto_next();