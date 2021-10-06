///scr_executeAction(battle_action);
//Executes the battle action.
var _damage = 0; //NOTE: in the future, base damage may be affected by level or something.

switch argument0
{
    case battle_action.slash: { _damage += 4; } break;
}

