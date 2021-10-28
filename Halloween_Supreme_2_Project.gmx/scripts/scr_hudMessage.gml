///scr_hudMessage(string,font,duration,color);
var hudString = argument0;
var hudFont;
if argument1 == 0 then hudFont = global.fnt_normal else hudFont = argument1;
var time = argument2;

var i = instance_create(0,0,efct_hudMessage);
i.hudFont = hudFont;//hudFont;
i.alarm[0] = time*room_speed; //Time displayed in seconds.
i.color = argument3;
i.hudString = hudString;
