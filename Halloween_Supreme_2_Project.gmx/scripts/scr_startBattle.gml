///scr_startBattle(mobID, location, init_instance);
var _mob = argument0;
var _location = argument1;
var init_instance = argument2;

var _mob_data = scr_getEnemyInfo(_mob);

show_debug_message(_mob_data[0]+" starts a battle.");

//Instantaite battle control
if !instance_exists(obj_battleControl)
{
    //Initialize the enemy!
    var _bat = instance_create(0,0,obj_battleControl);
    _bat.enemy_id = _mob;
    _bat.image_index = _mob;
    _bat.background = scr_getBackground(_location);
    _bat.enemy_name = _mob_data[0];
    _bat.enemy_level = _mob_data[1];
    _bat.enemy_max_hp = _mob_data[2];
    _bat.enemy_hp = _mob_data[2];
    _bat.init_instance = init_instance;
    
    with _bat
    {
        battle_string += (enemy_name+choose(" leaps from the shadows!"," bares its fangs!"," approaches!"," seeks violence."," engages you!"," is being a jerk."," picked trick!"," treats itself to a battle."," is feeling confident!")+"#");
    }
    
    
    //scr_musicTransition(scr_getMusic(_location),2);
    
    //Who goes first? - For now, always the player.
    /*if _mob_data[1] > 1 //NOTE: Replace with player level!
        _bat.player_turn = false;
    else
        _bat.player_turn = true;*/
    
    show_debug_message("A battle has begun!");
    //show_debug_message("Player turn?: "+string(_bat.player_turn));
}
else
{
    show_debug_message("scr_startBattle Error: A battle already exists.");
}
