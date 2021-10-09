///scr_inven_add_item(itemID, amount);
//Adds an item to the inventory. If the item already exists, increases its amount.
//Check to see if the item exists in the inventory.
var _item = argument0;
var _amt = argument1;

//The item exists. Increase the amount carried.
var current_amt = ds_list_find_value(global.inventory,_item);
var new_amt = current_amt+_amt;

//Replace the old ds_list entry with the new entry.
ds_list_replace(global.inventory,_item,new_amt);
