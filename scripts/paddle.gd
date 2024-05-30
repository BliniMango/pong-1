extends CharacterBody2D

@export var speed = 200

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_just_pressed("ui_down"):
		velocity.y += 1
	velocity = velocity.normalized() * speed
	move_and_slide()
