/// @description Do post_action

instance_destroy();

show_debug_message("Animation post action doned");

if (post_action != undefined) {
	script_execute(post_action, post_action_args);
}
