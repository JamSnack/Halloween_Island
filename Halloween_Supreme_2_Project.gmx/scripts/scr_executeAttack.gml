///scr_executeAttack(battle_attack);
//Executes the attack in battle.
//DEPENDENCIES: obj_battleControl must exist!

if instance_exists(obj_battleControl)
{
    var _damage = global.player_stats[STATS.attack]; //NOTE: in the future, base damage may be affected by level or something.
    var _info = scr_getAttackInfo(argument0);
    show_debug_message("dam "+string(_damage)+" + info "+string(_info[1])+" is "+string(_damage+_info[1]));
    _damage += _info[1]; //Add the attack damage to the base damage.
    
    //Harm the enemy after checking MP cost!
    if _info[2] <= global.player_stats[STATS.mp]
    {
        //Use MP
        global.player_stats[STATS.mp] -= _info[2];
        
        //Hurt the enemy
        with obj_battleControl
        {
            enemy_hp -= _damage;
            battle_string += (enemy_name+" took "+string(_damage)+" damage!#")
            image_yForce = irandom_range(180,360);
            image_zForce = irandom_range(90,180);
            action_finalized = noone;
            player_turn = false;
            battle_timer = 0;
            hurt_flash = 1;
            
            scr_playSound(snd_hurt,false,3,-1,-1,1,true);
            
            if enemy_hp <= 0 then event_user(0);
        }
    }
    else
    {
        with obj_battleControl
        {
            action_finalized = noone;
            battle_string += ("Not enough mana!#");
        }
    }
}
else show_debug_message("ERROR: scr_executeAttack cannot find obj_battleControl.");

