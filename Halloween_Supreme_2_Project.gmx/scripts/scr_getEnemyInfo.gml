///scr_getEnemyInfo(mobID);
var info = array_create(3);

switch argument0
{
    default:
    {
        info[0] = "Sphere Elite"; //Name
        info[1] = choose(1,2,3); //Level
        info[2] = 10; //Max HP
    }
}

return info;
