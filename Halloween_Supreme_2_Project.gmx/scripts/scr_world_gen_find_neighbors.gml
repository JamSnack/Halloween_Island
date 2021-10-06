/// Marks up to three possible tiles that can be chosen as the next tile for path generation.

// argument0: Main path or side path. Different rules for each.
// argument1: Direction of last tile placed. Influences how many neighbors are selected as candidates for the next tile.

if (argument0 == "main")
{
    switch (argument1)
    {
        // The next tile may be placed up, left, or right.
        case "up":
        {
            temp_1_x = curr_x;
            temp_1_y = curr_y - 1;
            
            if (curr_x > 3)
            {
                temp_2_x = curr_x - 1;
                temp_2_y = curr_y;
            }
            
            else
            {
                temp_2_x = temp_1_x;
                temp_2_y = temp_1_y;
            }
            
            if (curr_x < 8)
            {
                temp_3_x = curr_x + 1;
                temp_3_y = curr_y;
            }
            
            else
            {
                temp_3_x = temp_1_x;
                temp_3_y = temp_1_y;
            }
            
            break;
        }
        
        // The next tile may be placed up or left.
        case "left":
        {
            temp_1_x = curr_x;
            temp_1_y = curr_y - 1;
            
            if (curr_x > 3)
            {
                temp_2_x = curr_x - 1;
                temp_2_y = curr_y;
            }
            
            else
            {
                temp_2_x = temp_1_x;
                temp_2_y = temp_1_y;
            }
            
            temp_3_x = temp_1_x;
            temp_3_y = temp_1_y;
            
            break;
        }
        
        // The next tile may be placed up or right.
        case "right":
        {
            temp_1_x = curr_x;
            temp_1_y = curr_y - 1;
            
            temp_2_x = temp_1_x;
            temp_2_y = temp_1_y;
            
            if (curr_x < 8)
            {
                temp_3_x = curr_x + 1;
                temp_3_y = curr_y;
            }
            
            else
            {
                temp_3_x = temp_1_x;
                temp_3_y = temp_1_y;
            }
            
            break;
        }
    }
}

else if (argument0 == "side")
{
    switch (argument1)
    {
        // The next tile may be placed horizontally, up, or down.
        case "horizontal":
        {
            if (curr_x > 0 && branch_dir == 0)
            {
                temp_1_x = curr_x - 1;
                temp_1_y = curr_y;
            }
            
            else if (curr_x < 11 && branch_dir == 1)
            {
                temp_1_x = curr_x + 1;
                temp_1_y = curr_y;
            }
            
            else
                branch_length = 0;
            
            if (curr_y > 0)
            {
                temp_2_x = curr_x;
                temp_2_y = curr_y - 1;
            }
            
            else
            {
                temp_2_x = temp_1_x;
                temp_2_y = temp_1_y;
            }
            
            if (curr_y < 15)
            {
                temp_3_x = curr_x;
                temp_3_y = curr_y + 1;
            }
            
            else
            {
                temp_3_x = temp_1_x;
                temp_3_y = temp_1_y;
            }
            
            break;
        }
        
        // The next tile may be placed horizontally or up.
        case "up":
        {
            if (curr_x > 0 && branch_dir == 0)
            {
                temp_1_x = curr_x - 1;
                temp_1_y = curr_y;
            }
            
            else if (curr_x < 11 && branch_dir == 1)
            {
                temp_1_x = curr_x + 1;
                temp_1_y = curr_y;
            }
            
            else
                branch_length = 0;
            
            if (curr_y > 0)
            {
                temp_2_x = curr_x;
                temp_2_y = curr_y - 1;
            }
            
            else
                branch_length = 0;
            
            temp_3_x = temp_1_x;
            temp_3_y = temp_1_y;
            
            break;
        }
        
        // The next tile may be placed horizontally or down.
        case "down":
        {
            if (curr_x > 0 && branch_dir == 0)
            {
                temp_1_x = curr_x - 1;
                temp_1_y = curr_y;
            }
            
            else if (curr_x < 11 && branch_dir == 1)
            {
                temp_1_x = curr_x + 1;
                temp_1_y = curr_y;
            }
            
            else
                branch_length = 0;
            
            temp_2_x = temp_1_x;
            temp_2_y = temp_1_y;
            
            if (curr_y < 15)
            {
                temp_3_x = curr_x;
                temp_3_y = curr_y + 1;
            }
            
            else
                branch_length = 0;
            
            break;
        }
    }
}