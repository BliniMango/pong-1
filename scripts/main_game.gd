extends Node2D

@export var ball_scene: PackedScene

var score_left: int = 0
var score_right: int = 0

@onready var ball = $Ball
@onready var score_left_label = $CanvasLayer/ScoreLeft
@onready var score_right_label = $CanvasLayer/ScoreRight
@onready var left_goal = $LeftGoal
@onready var right_goal = $RightGoal

func _ready() -> void:
	score_left_label.text = str(score_left)
	score_right_label.text = str(score_right)
	if ball == null:
		ball = ball_scene.instantiate()
		add_child(ball)
	left_goal.connect("body_entered", Callable(self, "_on_left_goal_body_entered"))
	right_goal.connect("body_entered", Callable(self, "_on_right_goal_body_entered"))

func _on_left_goal_body_entered(body: Node) -> void:
	if body == ball:
		score_right += 1
		score_right_label.text = str(score_right)
		reset_ball()

func _on_right_goal_body_entered(body: Node) -> void:
	if body == ball:
		score_left += 1
		score_left_label.text = str(score_left)
		reset_ball()

func reset_ball() -> void:
	# Reset ball position
	var viewport_size = get_viewport_rect().size
	ball.position = viewport_size / 2
	ball.linear_velocity = Vector2.RIGHT.rotated(randf() * PI * 2) * ball.speed
