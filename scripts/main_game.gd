extends Node2D

@export var ball_scene = PackedScene

var score_left = 0
var score_right = 0

@onready var ball = $ball
@onready var score_left_label = $CanvasLayer/ScoreLeft
@onready var score_right_label = $CanvasLayer/ScoreRight


func _ready():
	score_left_label.text = str(score_left)
	score_right_label.text = str(score_right)
	if ball == null:
		ball = ball_scene
		add_child(ball)
	ball.connect("body_entered", Callable(self, "_on_ball_entered"))
	
func _on_ball_entered(body):
	if body.global_position.x < 0:
		score_right += 1
		score_right_label = str(score_right)
	else:
		score_left += 1
		score_left_label = str(score_left)
	#reset ball position
	ball.position = Vector2.ZERO
	ball.linear_velocity = Vector2.RIGHT.rotated(randf() * PI * 2) * ball.speed



