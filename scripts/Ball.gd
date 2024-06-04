extends CharacterBody2D

const speed = 300
var direction = Vector2.ZERO

func _ready():
#	randomize()
#	linear_velocity = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized() * speed
	direction.y = [1, -1].pick_random()
	direction.x = [1, -1].pick_random()
	
func _physics_process(delta):
	if direction != Vector2.ZERO:
		velocity = direction * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)
	move_and_slide()

















#func _integrate_forces(state):
#	if position.y < 0 or position.y > 650:
#		linear_velocity.y *= -1
	
#	if position.x < 0 or position.x > 1155:  # Assuming screen width is 800
#		linear_velocity.x *= -1
