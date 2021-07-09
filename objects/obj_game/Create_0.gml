/// @description Идеи для игры

game_version = "v1.0.3";

function start_properties() {
	score = 0;
	lives = 2;
	global.alive = true;
	global.shoots = 0;
	global.bullets = 10;
	global.shipX = 0;
	global.shipY = 0;
}

start_properties();

global.gamePaused = false;

global.mouseWasMoved = false;
mx = mouse_x;
my = mouse_y;

minAstero = 5;
maxAstero = 35;
maxAsteroAt = 1500;
asteroMaxCount = minAstero;

draw_set_font(fnt_text);
cursor_sprite = spr_cursor;
window_set_cursor(cr_none);

aster_delay = 0;
item_delay = 40;
item_delay_min = 20;
item_delay_max = 100;
item_delay_extra_chance = 5; //%

bg_offset = 0;

draw_dev_gui = false;

// Functions

function item_delay_add(delay) {
	item_delay += delay;
	
	if (item_delay < item_delay_min) {
		item_delay = item_delay_min;
	} else if (item_delay > item_delay_max) {
		item_delay = item_delay_max;
	}
}

function linear_interpolate_value(val, start_1, end_1, start_2, end_2) {
	return start_2 + (end_2 - start_2) * ((val - start_1) / (end_1 - start_1));
}

function calculate_astero_max_count() {
	if (score <= maxAsteroAt) {
		asteroMaxCount = linear_interpolate_value(score, 0, maxAsteroAt, minAstero, maxAstero);
	} else {
		asteroMaxCount = maxAstero;
	}
	
	asteroMaxCount = floor(asteroMaxCount);
}

function spawn_item() {
	var vertical_margin = 128;
	var spawn_y = irandom_range(vertical_margin / 2, room_height - vertical_margin);
	var item = instance_create_layer(-32, spawn_y, "Instances", obj_item);
	item.spawn_y = spawn_y;
}


/* ИДЕИ ДЛЯ ИГРЫ
	геймплей:
	[X] мелкие астероиды отнимают половину сердца и не убивают сразу.
	[X] максимальное количество астероидов зависит от счета
	[X] астероиды могут исчезнуть, вылетев за границу
	[X] столкновения с астероидами отбрасывает корабль и астероиды
	[X] края карты отталкивают игрока
	[ ] топливо кончается и возобновляется астероидами и предметами
	[Х] предметы не убегают за вертикальные границы карты.
	[?] при приближении к границе вертикальная скорость предметов уменьшается.
	[ ] Переработать способ вертикального позиционирования предметов 
		в зависимости от положения корабля (Предметы смещяются только вниз и дергаются
		при преодолении кораблем границ карты)
	[ ] случайные события (много астероидов за раз, кометы, тп)
		
	разное: 
	[+] меню паузы (Простой режим паузы. таймеры продолжают тикать)
	[ ] главное меню с настройками звука
	[ ] музыка в главном меню
	[ ] большая разнообразность геймплея
	[ ] выбор режимов игры
	
	предметы:
		- Патроны
		- Починка
		- Доп Жизнь
	
	визуал:
	[X] переключаемый интерфейс отладки
	[Х] анимация подбора предметов
	[ ] переработать параллакс звёзд
	[-] (Заменено анимациями предметов) предметы мигают когда летят
	[ ] добавить задний план, который постепенно плывет и
		изменяется с течением времени в зависимости от количества очков (этапы)
*/