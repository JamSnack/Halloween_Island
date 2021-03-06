/// scr_playSound(soundID, loop, priority, xx, yy, volume, dynamic_pitch)
var soundID = argument0, loop = argument1, priority = argument2, xx = argument3, yy = argument4, volume = argument5; dynamic_pitch = argument6;

if xx == -1 && yy == -1
{
    var _data = audio_listener_get_data(0);
    
    xx = _data[? "x"];
    yy = _data[? "y"];
}

//Stop existing sounds to play current sound.
if audio_exists(soundID)
{
    audio_stop_sound(soundID);
}

var _snd = audio_play_sound_at(soundID,xx,yy,0,0,16*6,1,loop,priority); 

if dynamic_pitch == true
{
    audio_sound_pitch(soundID,choose(0.9,1,1.1));
}

return _snd;
