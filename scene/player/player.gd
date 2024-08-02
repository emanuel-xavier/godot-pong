extends StaticBody2D

@export var is_player_one: bool
@export var player_speed: int = 500
var move_up_action: String
var move_down_action: String


func _ready():
	if is_player_one:
		move_up_action = "mv_up_p1"
		move_down_action = "mv_down_p1"
	else:
		move_up_action = "mv_up_p2"
		move_down_action = "mv_down_p2"


func _process(delta):
	move_player(delta)
	limit_movement_in_the_screen()


func move_player(delta: float) -> void:
	if Input.is_action_pressed(move_up_action):
		position.y -= player_speed * delta
	elif Input.is_action_pressed(move_down_action):
		position.y += player_speed * delta


func limit_movement_in_the_screen() -> void:
	position.y = clamp(position.y, 64, 654)


func reset_player_position() -> void:
	position.y = 360
