///scr_getItemInfo(itemID);
//var _info = array_create(2);
var name = "";

switch argument0
{
    case itemID.sword: { name = "Sword"; } break;
    case itemID.potion_hp: { name = "Red Treat"; } break;
    case itemID.potion_mana: { name = "Blue Treat"; } break;
    default: {name = "NULL";}
}

return name;
