///scr_startBattle(mobID, location);
var _mob = argument0;
var _location = argument1;

var _mob_data = scr_getEnemyInfo(_mob);

//Instantaite battle control
if !instance_exists(obj_battleControl)
{
    //Initialize the enemy!
    var _bat = instance_create(0,0,obj_battleControl);
    _bat.enemy_id = _mob;
    _bat.background = scr_getBackground(_location);
    _bat.enemy_name = _mob_data[0];
    _bat.enemy_level = _mob_data[1];
    _bat.enemy_max_hp = _mob_data[2];
    _bat.enemy_hp = _mob_data[2];
    
    
    scr_musicTransition(scr_getMusic(_location),1);
    
    //Who goes first?
    if _mob_data[1] > 1 //NOTE: Replace with player level!
        _bat.player_turn = false;
    else
        _bat.player_turn = true;
    
    show_debug_message("A battle has begun!");
    show_debug_message("Player turn?: "+string(_bat.player_turn));
}
else
{
    show_debug_message("scr_startBattle Error: A battle already exists.");
}
