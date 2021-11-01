///scr_getAttackInfo(battle_attack);
var info = array_create(3);
var p_level = global.player_stats[STATS.level];

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
        pinch_level = p_level-2;
        
        info[0] = "Magic Pinch"; //Name
        info[1] = irandom_range(10+(pinch_level*10),25+(pinch_level*10)); //Damage
        info[2] = 15+((pinch_level)*8); //MP Cost
        
        
        if global.player_stats[STATS.mp] < info[2]
        {
            info[0] = "Weak Magic Pinch: (low MP)"; //Name
            info[1] = irandom_range(1+p_level,floor(3+p_level*1.5)); //Damage
            info[2] = 0; //MP Cost
        }
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
        info[0] = "Obliterate"; //Name
        info[1] = irandom_range(15,35); //Damage
        info[2] = 0; //MP Cost
    }
    break;
    
    case battle_attack.annihilate:
    {
        info[0] = "Annihilate"; //Name
        info[1] = irandom_range(25,45); //Damage
        info[2] = 0; //MP Cost
    }
    break;
    
    case battle_attack.remove_flesh:
    {
        info[0] = "Remove Flesh"; //Name
        info[1] = irandom_range(35,60); //Damage
        info[2] = 0; //MP Cost
    }
    break;
    
    case battle_attack.kindness:
    {
        var _zh = p_level*2;
        var s_zh = string(_zh);
        
        info[0] = "Be Kind: "+s_zh+" is added to MP and Enemy HP."; //Name
        info[1] = _zh; //Damage
        info[2] = 0; //MP Cost
    }
    break;
}

//Append extra info
if info[2] > 0
{
    info[0] += (": -"+string(info[2])+" MP");
}

return info;
