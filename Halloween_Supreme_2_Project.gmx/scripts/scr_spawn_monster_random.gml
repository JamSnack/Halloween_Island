///scr_spawn_monster_random(mobID, amount, is_boss);
//Places monsters randomly within the maze.
var _mob = argument0;
var _amt = argument1;
var is_boss = argument2;
var maze_size = ds_grid_width(current_maze);
var tile_size = 32;

var _x = irandom_range(0,maze_size)*tile_size;
var _y = irandom_range(0,maze_size)*tile_size;
var potential_spawns = ds_list_create();

var _obj = obj_monster;

if is_boss then _obj = obj_boss;

//Find potential spawn locations
for(i=0;i<maze_size;i++)
{
    for(f=0;f<maze_size;f++)
    {
        if ds_grid_get(current_maze,f,i) == 0
        {
        
            var point = array_create(2);
            point[0] = f;
            point[1] = i;
            ds_list_add(potential_spawns,point);
        }
    }
}

//Place the creatures.
while(_amt>0)
{
    var selected_point = ds_list_find_value(potential_spawns,irandom(ds_list_size(potential_spawns)-1));
    
    if point_in_rectangle(selected_point[0]*tile_size,selected_point[1]*tile_size,view_xview,view_yview,view_xview+view_wview,view_yview+view_hview)
    {
        break;
    }
    
    var inst = instance_create(selected_point[0]*tile_size+16,selected_point[1]*tile_size+16,_obj);
    inst.mob_id = _mob;
    inst.image_index = _mob;
    
    _amt -= 1;
}
