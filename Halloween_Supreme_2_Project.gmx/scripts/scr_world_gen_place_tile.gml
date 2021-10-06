/// Does exactly what it says on the tin. Also randomizes the specific terrain sprite used.

// argument0: Main path or side path. Additional rules for each.

if (global.tile[curr_x, curr_y] == -1)
{
    global.tile[curr_x, curr_y] = 1;
    tile_count ++;
    
    if (argument0 == "side")
        branch_length --;
}

if (argument0 == "main")
{
    // Marks this tile as a branching point if it is the first in a certain row.
    if (branch_1_x == -1 && branch_1_y == curr_y)
    {
        branch_1_x = curr_x;
    }
    
    else if (branch_2_x == -1 && branch_2_y == curr_y)
    {
        branch_2_x = curr_x;
    }
    
    else if (branch_3_x == -1 && branch_3_y == curr_y)
    {
        branch_3_x = curr_x;
    }
}