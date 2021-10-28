///scr_executeItem(itemID);
//Executes the item in battle.
//DEPENDENCIES: obj_battleControl must exist!
var item_message = ""; //A container for whatever zaney shit appears in the textbox after using an item!

switch argument0
{
    case itemID.potion_hp: { global.player_stats[STATS.hp] = approach(global.player_stats[STATS.hp],global.player_stats[STATS.maxHp],25); item_message = "You heal 25 HP!#";} break;
    case itemID.potion_mana: { global.player_stats[STATS.mp] = approach(global.player_stats[STATS.mp],global.player_stats[STATS.maxMp],30); item_message = "You recover 30 MP!#"; } break;
}

//assume the item is used successfully if item_message != "";
if item_message != ""
{
    scr_inven_add_item(argument0,-1);
}


if instance_exists(obj_battleControl)
{
    //Next turn!
    with obj_battleControl
    {
        battle_string += item_message;
        action_finalized = noone;
        player_turn = false;
        battle_timer = 0;
        item_string = ""; //Flushing the item string will reinitialize it!
        item_action_selected = 0;
        
        if ds_exists(possible_items,ds_type_list) then ds_list_destroy(possible_items);
        possible_items = ds_list_create();
        
        //Replace hurt sound with something else!
        //scr_playSound(snd_hurt,false,3,0,0,1,true);
    }
}

