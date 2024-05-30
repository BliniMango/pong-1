extends RigidBody2D

@export var speed = 300

func _ready() -> void:
	#add an impluse to the ball on start to get it bouncing
	apply_impulse(Vector2.ZERO, Vector2.RIGHT.rotated(randf() * PI * 2) * speed)

func _integrate_forces(state):
	var velocity = state.get_linear_velocity()
	velocity = velocity.normalized() * speed
	state.set_linear_velocity(velocity)
