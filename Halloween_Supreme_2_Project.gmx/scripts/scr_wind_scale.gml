/// Resizes the game window and sets an alarm to recenter the window one step later.

// Argument 0: the scale factor to multiply the game window size by.

window_set_size(256*argument0, 224*argument0);
alarm[0] = 1;
