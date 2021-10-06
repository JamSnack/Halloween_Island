/// Generates a random overworld that the game will take place on.

switch (gen_state)
{
    // Step 0: Place the beginning tile.
    case 0:
    {
        // Pick a location along the somewhere in the middle along the bottom row of the overworld.
        curr_x = choose(5, 6);
        curr_y = 15;
        
        scr_world_gen_place_tile("none");
        scr_world_gen_find_neighbors("main", "up");
        
        gen_state = 1;
        
        break;
    }
    
    // Step 1: Construct the overworld's "main path." This is an upward path that may shift to the left or right along the way.
    case 1:
    {
        // 50% (or 75%) chance of placing the next tile up. 50% (or 25%) chance of placing the tile to a side.
        temp = choose(1, 1, 2, 3);
        
        switch (temp)
        {
            // Place the next tile up.
            case 1:
            {
                curr_x = temp_1_x;
                curr_y = temp_1_y;
                
                scr_world_gen_place_tile("main");
                scr_world_gen_find_neighbors("main", "up");
                
                break;
            }
            
            // Place the next tile left (or up, if the last tile was placed right or the left edge was reached).
            case 2:
            {
                curr_x = temp_2_x;
                curr_y = temp_2_y;
                
                scr_world_gen_place_tile("main");
                scr_world_gen_find_neighbors("main", "left");
                
                break;
            }
            
            // Place the next tile right (or up, if the last tile was placed left or the right edge was reached).
            case 3:
            {
                curr_x = temp_3_x;
                curr_y = temp_3_y;
                
                scr_world_gen_place_tile("main");
                scr_world_gen_find_neighbors("main", "right");
                
                break;
            }
        }
        
        // Advances to the next step when the top row of the overworld is reached. Skips the next step if an inordinate number of tiles have already been generated.
        if (curr_y == 0)
        {
            if (tile_count < 32)
                gen_state = 2;
            
            else
                gen_state = 4;
        }
        
        break;
    }
    
    // Step 2: Construct side paths branching off of specific points on the main path until three paths are generated or a minimum threshold of tiles is reached.
    case 2:
    {
        // Selects one of three possible positions to establish a side path at.
        if (!branch_1 && !branch_2 && !branch_3)
            temp = choose(1, 2, 3);
        
        else if (branch_1 && !branch_2 && !branch_3)
            temp = choose(2, 3);
        
        else if (!branch_1 && branch_2 && !branch_3)
            temp = choose(1, 3);
        
        else if (!branch_1 && !branch_2 && branch_3)
            temp = choose(1, 2);
        
        else if (branch_1 && branch_2 && !branch_3)
            temp = 3;
        
        else if (branch_1 && !branch_2 && branch_3)
            temp = 2;
        
        else
            temp = 1;
        
        switch (temp)
        {
            // Side path one.
            case 1:
            {
                // Builds to the left if the right is obstructed.
                if (global.tile[branch_1_x - 1, branch_1_y] == -1 && global.tile[branch_1_x + 1, branch_1_y] != -1)
                {
                    curr_x = branch_1_x - 1;
                    curr_y = branch_1_y;
                    branch_1 = true;
                    branch_dir = 0;
                }
                
                // Builds to the right if the left is obstructed.
                else if (global.tile[branch_1_x - 1, branch_1_y] != -1 && global.tile[branch_1_x + 1, branch_1_y] == -1)
                {
                    curr_x = branch_1_x + 1;
                    curr_y = branch_1_y;
                    branch_1 = true;
                    branch_dir = 1;
                }
                
                // Randomly picks a direction if neither direction is obstructed.
                else
                {
                    if (choose(1, 2) == 1)
                    {
                        curr_x = branch_1_x - 1;
                        curr_y = branch_1_y;
                        branch_1 = true;
                        branch_dir = 0;
                    }
                    
                    else
                    {
                        curr_x = branch_1_x + 1;
                        curr_y = branch_1_y;
                        branch_1 = true;
                        branch_dir = 1;
                    }
                }
                
                break;
            }
            
            // Side path two.
            case 2:
            {
                // Builds to the left if the right is obstructed.
                if (global.tile[branch_2_x - 1, branch_2_y] == -1 && global.tile[branch_2_x + 1, branch_2_y] != -1)
                {
                    curr_x = branch_2_x - 1;
                    curr_y = branch_2_y;
                    branch_2 = true;
                    branch_dir = 0;
                }
                
                // Builds to the right if the left is obstructed.
                else if (global.tile[branch_2_x - 1, branch_2_y] != -1 && global.tile[branch_2_x + 1, branch_2_y] == -1)
                {
                    curr_x = branch_2_x + 1;
                    curr_y = branch_2_y;
                    branch_2 = true;
                    branch_dir = 1;
                }
                
                // Randomly picks a direction if neither direction is obstructed.
                else
                {
                    if (choose(1, 2) == 1)
                    {
                        curr_x = branch_2_x - 1;
                        curr_y = branch_2_y;
                        branch_2 = true;
                        branch_dir = 0;
                    }
                    
                    else
                    {
                        curr_x = branch_2_x + 1;
                        curr_y = branch_2_y;
                        branch_2 = true;
                        branch_dir = 1;
                    }
                }
                
                break;
            }
            
            // Side path three.
            case 3:
            {
                // Builds to the left if the right is obstructed.
                if (global.tile[branch_3_x - 1, branch_3_y] == -1 && global.tile[branch_3_x + 1, branch_3_y] != -1)
                {
                    curr_x = branch_3_x - 1;
                    curr_y = branch_3_y;
                    branch_3 = true;
                    branch_dir = 0;
                }
                
                // Builds to the right if the left is obstructed.
                else if (global.tile[branch_3_x - 1, branch_3_y] != -1 && global.tile[branch_3_x + 1, branch_3_y] == -1)
                {
                    curr_x = branch_3_x + 1;
                    curr_y = branch_3_y;
                    branch_3 = true;
                    branch_dir = 1;
                }
                
                // Randomly picks a direction if neither direction is obstructed.
                else
                {
                    if (choose(1, 2) == 1)
                    {
                        curr_x = branch_3_x - 1;
                        curr_y = branch_3_y;
                        branch_3 = true;
                        branch_dir = 0;
                    }
                    
                    else
                    {
                        curr_x = branch_3_x + 1;
                        curr_y = branch_3_y;
                        branch_3 = true;
                        branch_dir = 1;
                    }
                }
                
                break;
            }
        }
        
        branch_count ++;
        branch_length = choose(5, 6, 7, 8);
        
        scr_world_gen_place_tile("side");
        scr_world_gen_find_neighbors("side", "horizontal");
        
        gen_state = 3;
        
        break;
    }
    
    // Step 3: Construct the side path. This is a horizontal path that may shift up or down along the way.
    case 3:
    {
        // 50% (or 75%) chance of placing the next tile horizontally. 50% (or 25%) chance of placing the tile up or down.
        temp = choose(1, 1, 1, 2, 3);
        
        switch (temp)
        {
            // Place the next tile horizontally.
            case 1:
            {
                curr_x = temp_1_x;
                curr_y = temp_1_y;
                
                scr_world_gen_place_tile("side");
                scr_world_gen_find_neighbors("side", "horizontal");
                
                break;
            }
            
            // Place the next tile up.
            case 2:
            {
                curr_x = temp_2_x;
                curr_y = temp_2_y;
                
                scr_world_gen_place_tile("side");
                scr_world_gen_find_neighbors("side", "up");
                
                break;
            }
            
            // Place the next tile down.
            case 3:
            {
                curr_x = temp_3_x;
                curr_y = temp_3_y;
                
                scr_world_gen_place_tile("side");
                scr_world_gen_find_neighbors("side", "down");
                
                break;
            }
        }
        
        // Returns to the previous step when the side path is finished. Advances to the next step instead if enough tiles or side paths have been placed.
        if (branch_length > 0)
        {
            
        }
        
        else if (tile_count < 32 && branch_count < 3)
            gen_state = 2;
        
        else
            gen_state = 4;
        
        break;
    }
    
    // Step 3: Place tile clusters along the main path.
    case 4:
    {
        scr_world_gen_place_cluster("small", branch_1_x, branch_1_y);
        scr_world_gen_place_cluster(choose("small", "large"), round((branch_1_x + branch_2_x + choose(0.01, -0.01)) / 2), round((branch_1_y + branch_2_y + choose(0.01, -0.01)) / 2));
        scr_world_gen_place_cluster("large", branch_2_x, branch_2_y);
        scr_world_gen_place_cluster(choose("small", "large"), round((branch_2_x + branch_3_x + choose(0.01, -0.01)) / 2), round((branch_2_y + branch_3_y + choose(0.01, -0.01)) / 2));
        scr_world_gen_place_cluster("small", branch_3_x, branch_3_y);
        
        gen_state = 5;
        
        break;
    }
}
