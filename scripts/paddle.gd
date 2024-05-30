extends CharacterBody2D

@export var speed = 200

func _process(_delta):
	velocity = Vector2.ZERO  # Reset the velocity each frame
	
	# Check for input
	if Input.is_action_pressed("move_up"):
		velocity.y -= speed
	if Input.is_action_pressed("move_down"):
		velocity.y += speed
	
	# Move the paddle
	move_and_slide()
