///scr_executeAttack(battle_attack);
//Executes the attack in battle.
//DEPENDENCIES: obj_battleControl must exist!

if instance_exists(obj_battleControl)
{
    var _damage = global.player_stats[STATS.attack]; //NOTE: in the future, base damage may be affected by level or something.
    var _info = scr_getAttackInfo(argument0);
    show_debug_message("dam "+string(_damage)+" + info "+string(_info[1])+" is "+string(_damage+_info[1]));
    _damage += _info[1]; //Add the attack damage to the base damage.
    
    show_debug_message("argument0?: "+ string(argument0));
    
    //Harm the enemy!
    with obj_battleControl
    {
        enemy_hp -= _damage;
        battle_string += (enemy_name+" took "+string(_damage)+" damage!#")
        image_yForce = irandom_range(180,360);
        image_zForce = irandom_range(90,180);
        action_finalized = noone;
        
        if enemy_hp <= 0 then event_user(0);
    }
}
else show_debug_message("ERROR: scr_executeAttack cannot find obj_battleControl.");

