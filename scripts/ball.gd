extends RigidBody2D

@export var speed = 300

func _ready() -> void:
	reset_ball()

func reset_ball() -> void:
	var direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	linear_velocity = direction * speed
