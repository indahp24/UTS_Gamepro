extends Node2D

var p1_score = 0
var p2_score = 0

@onready var p_1_score = $scores/p1_score
@onready var p_2_score = $scores/p2_score

const PLAYER_1 = preload("res://Scene/player_1.tscn")
const PLAYER_2 = preload("res://Scene/player_2.tscn")

@onready var game_over: Control = $game_over
@onready var win_text: Label = $game_over/win_text

var score_limit = 2

func _process(_delta):
	if p1_score == 2:
		get_tree().paused=true
		game_over.visible = true
		win_text.text = "Player 1 Menang"

	if p2_score == 2:
		get_tree().paused=true
		game_over.visible = true
		win_text.text = "Player 2 Menang"
		
		
func increment_p1_score():
	p1_score+=1
	p_1_score.text = "P1: " + str(p1_score)
	
func increment_p2_score():
	p2_score+=1
	p_2_score.text = "P2: " + str(p2_score)

	
func respawn_p1():
	var p1 = PLAYER_1.instantiate()
	p1.position = Vector2(randf_range(65, 1097), randf_range(50, 606))
	add_child(p1)

func respawn_p2():
	var p2 = PLAYER_2.instantiate()
	p2.position = Vector2(randf_range(65, 1097), randf_range(50, 606))
	add_child(p2)


func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
