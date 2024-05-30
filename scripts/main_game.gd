extends Node2D

@export var ball_scene: PackedScene

var score_left: int = 0
var score_right: int = 0

@onready var ball: RigidBody2D = null
@onready var score_left_label: Label = $CanvasLayer/ScoreLeft
@onready var score_right_label: Label = $CanvasLayer/ScoreRight
@onready var left_goal: Area2D = $LeftGoal
@onready var right_goal: Area2D = $RightGoal
@onready var reset_timer: Timer = $ResetTimer

func _ready() -> void:
	# Ensure the ball scene is assigned
	if ball_scene == null:
		print("Error: ball_scene is not assigned.")
		return
	
	# Update score labels
	score_left_label.text = str(score_left)
	score_right_label.text = str(score_right)
	
	# Connect signals for goals and timer
	left_goal.connect("body_entered", Callable(self, "_on_left_goal_body_entered"))
	right_goal.connect("body_entered", Callable(self, "_on_right_goal_body_entered"))
	# reset_timer.connect("timeout", Callable(self, "_on_reset_timer_timeout"))
	
	# Instance the ball if it's not already present
	if ball == null:
		ball = ball_scene.instantiate() as RigidBody2D
		add_child(ball)
		print("Ball instantiated")
	else:
		print("Ball already exists")
	
	reset_ball()

func _on_left_goal_body_entered(body: Node) -> void:
	if body == ball:
		score_right += 1
		score_right_label.text = str(score_right)
		start_reset_timer()

func _on_right_goal_body_entered(body: Node) -> void:
	if body == ball:
		score_left += 1
		score_left_label.text = str(score_left)
		start_reset_timer()

func start_reset_timer() -> void:
	ball.linear_velocity = Vector2.ZERO
	ball.position = Vector2.ZERO
	reset_timer.start()

func _on_reset_timer_timeout() -> void:
	reset_ball()

func reset_ball() -> void:
	# Get the size of the viewport
	var viewport_size = get_viewport_rect().size
	
	# Set ball position to the center of the viewport
	ball.position = viewport_size / 2
	print("Ball position reset to: ", ball.position)
	
	# Apply an initial random impulse to the ball
	ball.linear_velocity = Vector2.RIGHT.rotated(randf() * PI * 2) * ball.speed
	print("Ball velocity set to: ", ball.linear_velocity)
