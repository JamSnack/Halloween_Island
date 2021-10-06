/// Resizes the game window and sets an alarm to recenter the window one step later.

// Argument 0: the scale factor to multiply the game window size by.

window_set_size(256*argument0, 224*argument0);
display_set_gui_size(256,224); //Ensure that the GUI layer STAYS THE SAME SIZE!!
alarm[0] = 1;
