///scr_startBattle(mobID, location);
var _mob = argument0;
var _location = argument1;

//Instantaite battle control
var _bat = instance_create(0,0,obj_battleControl);
_bat.enemy_id = _mob;
_bat.background = scr_getBackground(_location);
scr_musicTransition(scr_getMusic(_location),1);
