/// Places a cluster of tiles around a given point.

// argument0: The size of cluster to generate.
// argument1: The x-coordinate of the tile to be used as the center.
// argument2: The y-coordinate of the tile to be used as the center.

switch (argument0)
{
    case "small":
    {
        for (j = argument2 - 1; j <= argument2 + 1; j ++)
            for (i = argument1 - 1; i <= argument1 + 1; i ++)
            {
                if (i >= 0 && i <= 11 && j >= 0 && j <= 15)
                    global.tile[i, j] = 1;
            }
        
        break;
    }
    
    case "large":
    {
        for (j = argument2 - 2; j <= argument2 + 2; j ++)
            for (i = argument1 - 2; i <= argument1 + 2; i ++)
            {
                if (!(i == argument1 - 2 && j == argument2 - 2) && !(i == argument1 + 2 && j == argument2 - 2) && !(i == argument1 - 2 && j == argument2 + 2) && !(i == argument1 + 2 && j == argument2 + 2) && i >= 0 && i <= 11 && j >= 0 && j <= 15)
                    global.tile[i, j] = 1;
            }
        
        break;
    }
}
