extends CharacterBody2D

@export var speed = 150
@onready var ball = get_parent().get_node("Ball")

func _process(delta):
	var dir = (ball.position.y - position.y)
	dir = sign(dir) if abs(dir) > 10 else 0
	var velocity = Vector2(0, dir).normalized() * speed
	move_and_slide()
