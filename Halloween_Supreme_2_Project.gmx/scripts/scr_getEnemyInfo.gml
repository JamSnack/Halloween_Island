///scr_getEnemyInfo(mobID);
var info = array_create(3);

switch argument0
{
    case mobID.Apro:
    {
        info[0] = choose("Rabid Oinkling","Halloween Ham","Oinker Supreme"); //Name
        info[1] = 25; //Level
        info[2] = 2500; //Max HP
    }
    break;
    
    case mobID.corn_coblin:
    {
        info[0] = "Corn-Coblin";
        info[1] = 1;
        info[2] = 10;
    }
    break;
    
    default:
    {
        info[0] = "Sphere Elite"; //Name
        info[1] = choose(1,2,3); //Level
        info[2] = 10; //Max HP
    }
}

return info;
