/// @description Do post_action

instance_destroy();


if (post_action != undefined) {
	script_execute(post_action, post_action_args);
}
