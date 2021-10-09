///scr_getItemInfo(itemID);
//var _info = array_create(2);
var name = "";

switch argument0
{
    case itemID.sword: { name = "Sword"; } break;
    case itemID.potion_hp: { name = "Health Potion"; } break;
    case itemID.potion_mana: { name = "Mana Potion"; } break;
    default: {name = "NULL";}
}

return name;
