/// Fills in arrays which track the state of the game overworld, character statistics, possible names for important locations, and so on.

// Globals! These are extra important!

// Tracks the current state of the game.
global.state = 0;

// Fills in the overworld tile arrays with default values.
for (j = 15; j >= 0; j --)
    for (i = 11; i >= 0; i --)
    {
        global.tile[i, j] = -1;
    }

// Locals!

// Tracks the current state of the overworld generation algorithm.
gen_state = 0;

// Counts how many tiles and branches have been placed up to this point.
tile_count = 0;
branch_count = 0;

// Tracks which branching paths have been laid down.
branch_1 = false;
branch_2 = false;
branch_3 = false;

// Marks points along the main path to use for creating side paths and filling in with tiles.
branch_1_x = -1;
branch_1_y = choose(12, 13, 14);
branch_2_x = -1;
branch_2_y = choose(7, 8, 9);
branch_3_x = -1;
branch_3_y = choose(2, 3, 4);

// Determines the length and direction of the branching paths.
branch_length = -1;
branch_dir = -1;

// Pointers for the current tile location.
curr_x = -1;
curr_y = -1;

// Pointers for potential locations to place the next tile.
temp = -1;
temp_1_x = -1;
temp_1_y = -1;
temp_2_x = -1;
temp_2_y = -1;
temp_3_x = -1;
temp_3_y = -1;

// Initiates world generation.
alarm[1] = 4;
