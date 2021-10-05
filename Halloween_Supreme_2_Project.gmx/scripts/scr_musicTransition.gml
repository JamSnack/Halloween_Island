///scr_musicTransition(soundid,time);
var time = argument1;

//Stop existing music
if audio_exists(global.music)
{
    audio_sound_gain(global.music,0,time);
}

//Start new music
global.music = audio_play_sound(argument0,10,true);
audio_sound_gain(global.music,0,0);
audio_sound_gain(global.music,0,time); //NOTE: Temporarily disabled music by setting volume to 0~!
