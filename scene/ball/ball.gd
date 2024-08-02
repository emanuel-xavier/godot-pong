extends Area2D

@export var ball_speed: float = 500
var initial_position: Vector2 = Vector2(640.0, 360.0)
var initial_direction: Vector2 = Vector2(0.0, 0.0)
var new_direction: Vector2 = Vector2(0.0, 0.0)

var min_y: float = 0
var max_y: float = 720

@onready var timer: Timer = $Timer
@onready var playerImpactSound: AudioStreamPlayer = $playerImpactSound
@onready var wallImpactSound: AudioStreamPlayer = $wallImpactSound

func _ready():
	reset_ball()


func _process(delta):
	hadnle_ball_movement(delta)
	handle_wall_colide()


func run_timer() -> void:
	timer.start()


func chose_initial_direction() -> void:
	var rand_x: int = [-1, 1].pick_random()
	var rand_y: int = [-1, 1].pick_random()
	
	initial_direction = Vector2(rand_x, rand_y)
	new_direction = initial_direction


func hadnle_ball_movement(delta: float) -> void:
	position += new_direction * ball_speed * delta


func reset_ball() -> void:
	position = initial_position
	chose_initial_direction()



func handle_wall_colide() -> void:
	if position.y <= min_y or position.y >= max_y:
		new_direction.y *= -1
		wallImpactSound.play()


func _on_body_entered(body):
	if body.is_in_group("players"):
		new_direction.x *= -1
		playerImpactSound.play()
		


func _on_timer_timeout():
	reset_ball()
