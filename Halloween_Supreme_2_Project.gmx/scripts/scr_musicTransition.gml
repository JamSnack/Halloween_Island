///scr_musicTransition(soundid,time);
var time = argument1;

//Stop existing music
if audio_exists(global.music)
{
    audio_stop_sound(global.music);
}

//Start new music
audio_sound_gain(global.music,0,1);
global.music = audio_play_sound(argument0,5,true);
audio_sound_gain(global.music,1,time);
