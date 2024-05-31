extends CharacterBody2D

@export var speed: float = 400


func _ready():
	randomize()
	velocity = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized() * speed
	
func _physics_process(_delta):
	move_and_slide()
	if position.y < 0 or position.y > 600:
		velocity.y *= -1
	if position.x < 0 or position.x > 600:
		velocity.y *= -1


