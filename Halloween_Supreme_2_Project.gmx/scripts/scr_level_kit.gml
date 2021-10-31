///scr_level_kit(level);
//Changes the player's attack options based on their level. A temporary solution to having no inventory.

var lvl = argument0;
var temp_list = ds_list_create();

switch lvl
{
    case 1: { global.unlocked_attacks[battle_attack.pinch] = 1; } break;
    case 2: { global.unlocked_attacks[battle_attack.magic_pinch] = 1; } break;
    case 3: { global.unlocked_attacks[battle_attack.pinch] = 0; global.unlocked_attacks[battle_attack.slap] = 1; } break;
    case 4: { global.unlocked_attacks[battle_attack.kindness] = 1; } break;
    case 5: { global.unlocked_attacks[battle_attack.slap] = 0; global.unlocked_attacks[battle_attack.smash] = 1; } break;
    case 6: { global.unlocked_attacks[battle_attack.smash] = 0; global.unlocked_attacks[battle_attack.destroy] = 1; } break;
    case 7: { global.unlocked_attacks[battle_attack.destroy] = 0; global.unlocked_attacks[battle_attack.remove_flesh] = 1; } break;
}
