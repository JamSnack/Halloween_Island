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
    
    case mobID.punkler:
    {
        info[0] = "Greivous Punkler";
        info[1] = 1+(difficulty div 3);
        info[2] = 10+(difficulty div 3)*2;
    }
    break;
    
    case mobID.handsome_patch:
    {
        info[0] = "Notorious Guapo";
        info[1] = 3+(difficulty div 2);
        info[2] = 25+(difficulty div 2)*2;
    }
    break;
    
    case mobID.corn_cretin:
    {
        info[0] = choose("Corn, the Witness","Corn Cretin");
        info[1] = 5+(difficulty);
        info[2] = 40+(difficulty)*2;
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
