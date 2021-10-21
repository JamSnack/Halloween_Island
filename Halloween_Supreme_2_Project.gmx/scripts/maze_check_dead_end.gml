///maze_check_dead_end(maze_grid_id, maze_cell_x, maze_cell_y, wall_value);
//Returns true if a given cell has 3 adjacent walls and 1 adjacent non-wall.
var _grid = argument0;
var _x = argument1;
var _y = argument2;
var wall_value = argument3; //The cell value of a wall.

var open_left = (ds_grid_get(_grid,_x,_y+1) == wall_value && ds_grid_get(_grid,_x+1,_y) == wall_value && ds_grid_get(maze_grid,_x,_y-1) == wall_value);
var open_right = (ds_grid_get(_grid,_x,_y+1) == wall_value && ds_grid_get(_grid,_x-1,_y) == wall_value && ds_grid_get(maze_grid,_x,_y-1) == wall_value);
var open_up = (ds_grid_get(_grid,_x,_y+1) == wall_value && ds_grid_get(_grid,_x+1,_y) == wall_value && ds_grid_get(maze_grid,_x-1,_y) == wall_value);
var open_down = (ds_grid_get(_grid,_x,_y-1) == wall_value && ds_grid_get(_grid,_x+1,_y) == wall_value && ds_grid_get(maze_grid,_x-1,_y) == wall_value);

if open_left || open_right || open_up || open_down
{
    return true;
} else return false;
