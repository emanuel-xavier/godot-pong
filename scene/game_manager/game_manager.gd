extends Node2D

@onready var ball: Area2D = $"../ball"

var p1_score: int = 0
var p2_score: int = 0
@onready var p1_score_label: Label = $"../UI/ScorePanerl/p1_score"
@onready var p2_score_label: Label = $"../UI/ScorePanerl/p2_score"
@onready var goalSound: AudioStreamPlayer = $golSound

func _ready():
	pass


func _process(delta):
	process_input()


func _on_gol_p_1_area_entered(area):
	p1_score += 1
	ball.run_timer()
	
	p1_score_label.text = str(p1_score)
	goalSound.play()


func _on_gol_p_2_area_entered(area):
	p2_score += 1
	ball.run_timer()
	
	p2_score_label.text = str(p2_score)
	goalSound.play()


func process_input() -> void:
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
