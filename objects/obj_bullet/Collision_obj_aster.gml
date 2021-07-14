instance_destroy();

other.destroy(true, true);


global.kills += 1;
global.score_multiply += 1;
if (global.score_multiply > 20) global.score_multiply = 20;
audio_play_sound(snd_explode, 1, false);
//audio_play_sound(snd_coin, 2, false);