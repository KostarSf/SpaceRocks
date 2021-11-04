enum tutorial_stage {
	tutorial_move,
	tutorial_shoot,
	tutorial_pickup,
	tutorial_help,
}

_tutorial_stage = tutorial_stage.tutorial_move;

_pir = instance_nearest(x, y, obj_pirate);
_en = 0;

image_xscale = 2;
image_yscale = 2;