cursor_sprite = -1;

stage_1_intro_animation = instance_create_layer(0, 0, "Instances", obj_stage_1_intro_animation);

bg_target = stage_1_intro_animation.get_bg_target();

audio_stop_all();
music_clear_queue();
music_add_to_queue(msc_game_theme_1_intro, false);
music_add_to_queue(msc_game_theme_1, true);