///init_inventory();
//Initializes the inventory and itemID.
enum itemID
{
    potion_hp,
    potion_mana,
    sword,
}

//Init inventory list
global.inventory = ds_list_create();

//NOTE: set i < highest itemID to initialize every item successfully.
for(i=0;i<itemID.sword+1;i++)
{
    ds_list_add(global.inventory,0); //Sets every item amount to 0.
}
