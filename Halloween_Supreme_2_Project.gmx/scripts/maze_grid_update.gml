///maze_grid_update(direction, path_length);
var move_to = argument0;
var p_length = argument1;

//Replace ds_grid_set functions later with a for loop that loops the size of path_length.

var floor_value = 0;

for(_i=1;_i<=p_length;_i++)
{
    if ds_grid_get(maze_grid,carver_x+directions_x[? move_to]*_i,carver_y+directions_y[? move_to]*_i) != 0
    {
        ds_grid_set(maze_grid,carver_x+directions_x[? move_to]*_i,carver_y+directions_y[? move_to]*_i,floor_value);
    }
    else break;
} 


carver_y += directions_y[? move_to]*p_length;
carver_x += directions_x[? move_to]*p_length;

//Only visit key cells. Backtracking cells one at a time will fuck with the maze.
ds_list_add(visited_cells_x,carver_x);
ds_list_add(visited_cells_y,carver_y);

ds_list_clear(directions_checked);

carver_x = clamp(carver_x,1,maze_size-1);
carver_y = clamp(carver_y,1,maze_size-1);

show_debug_message("UPDATE!");
