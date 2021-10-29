///scr_getAttackInfo(battle_attack);
var info = array_create(3);

switch argument0
{
    case battle_attack.pinch:
    {
        info[0] = "Pinch"; //Name
        info[1] = irandom_range(1,3); //Damage
        info[2] = 0; //MP Cost
    }
    break;
    
    case battle_attack.magic_pinch:
    {
        info[0] = "Magic Pinch"; //Name
        info[1] = irandom_range(10,25); //Damage
        info[2] = 15; //MP Cost
    }
    break;
    
    case battle_attack.slap:
    {
        info[0] = "Slap"; //Name
        info[1] = irandom_range(5,9); //Damage
        info[2] = 0; //MP Cost
    }
    break;
    
    case battle_attack.smash:
    {
        info[0] = "Smash"; //Name
        info[1] = irandom_range(8,15); //Damage
        info[2] = 0; //MP Cost
    }
    break;
    
    case battle_attack.destroy:
    {
        info[0] = "Destroy"; //Name
        info[1] = irandom_range(10,25); //Damage
        info[2] = 0; //MP Cost
    }
    break;
    
    case battle_attack.obliterate:
    {
        info[0] = "Destroy"; //Name
        info[1] = irandom_range(15,40); //Damage
        info[2] = 0; //MP Cost
    }
    break;
    
    case battle_attack.remove_flesh:
    {
        info[0] = "Remove Flesh"; //Name
        info[1] = irandom_range(25,45); //Damage
        info[2] = 0; //MP Cost
    }
    break;
}

return info;
