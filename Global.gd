extends Node

var VP = Vector2.ZERO

var score = 0
var time = 20
var lives = 5
var level = -1
var currentEnemies = 1

var levels = [
	{
		"title": "Level 1",
		"subtitle": "Destory the meteors!",
		"meteors":[Vector2(100,100),Vector2(900,500)],
		"enemies":[],
		"timer":100,
		"meteors_spawned":false,
		"enemies_spawned":false,
	},
	{
		"title": "Level 2",
		"subtitle": "Destory the meteors and watch out for the enemies!",
		"meteors":[Vector2(100,100),Vector2(900,500),Vector2(800,200)],
		"enemies":[Vector2(150,500)],
		"timer":80,
		"meteors_spawned":false,
		"enemies_spawned":false,
	}
	
	
	
	
	
]

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	randomize()
	VP = get_viewport().size
	var _signal = get_tree().get_root().connect("size_changed", self, "_resize")

func _resize():
	VP = get_viewport().size
	
func reset():
	get_tree().paused = false
	score = 0
	time = 20
	lives = 5
	

func update_score(s):
	score += s
	var hud = get_node_or_null("/root/Level_1/UI/HUD")
	if hud != null:
		hud.update_score()

func update_lives(l):
	lives += l
	if lives <= 0:
		var scene = get_tree().change_scene("res://UI/End_Game.tscn")
	var hud = get_node_or_null("/root/Level_1/UI/HUD")
	if hud != null:
		hud.update_lives()

func update_time(t):
	time += t
	if time <= 0:
		var scene = get_tree().change_scene("res://UI/End_Game.tscn")
	var hud = get_node_or_null("/root/Level_1/UI/HUD")
	if hud != null:
		hud.update_time()

func next_level():
	level += 1
	if level >= levels.size():
		var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
	else:
		var level_label = get_node_or_null("/root/Game/UI/Level")
		if level_label != null:
			level_label.show_labels()
