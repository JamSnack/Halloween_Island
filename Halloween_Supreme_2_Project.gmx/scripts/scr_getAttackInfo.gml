///scr_getAttackInfo(battle_attack);
var info = array_create(3);

switch argument0
{
    case battle_attack.slash:
    {
        info[0] = "Slash"; //Name
        info[1] = choose(1,2,3); //Damage
        info[2] = 0; //MP Cost
    }
    break;
    
    case battle_attack.fireball:
    {
        info[0] = "Fireball"; //Name
        info[1] = irandom_range(5,10); //Damage
        info[2] = 25; //MP Cost
    }
    break;
}

return info;
