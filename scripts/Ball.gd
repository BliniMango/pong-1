extends RigidBody2D

@export var speed: float = 400

func _ready():
	randomize()
	linear_velocity = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized() * speed

func _integrate_forces(state):
	if position.y < 0 or position.y > 650:
		linear_velocity.y *= -1
	
	if position.x < 0 or position.x > 1155:  # Assuming screen width is 800
		linear_velocity.x *= -1
