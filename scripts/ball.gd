extends RigidBody2D

@export var speed = 300

func _ready() -> void:
	reset_ball()

func reset_ball() -> void:
	 # Apply an initial random impulse to the ball
	linear_velocity = Vector2.RIGHT.rotated(randf() * PI * 2) * speed
