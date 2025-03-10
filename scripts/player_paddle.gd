extends CharacterBody2D

@export var speed = 300

var direction


# controls
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity.y -= speed * delta
	elif Input.is_action_pressed("ui_down"):
		velocity.y += speed* delta
	
	position += velocity
	
	# make sure paddle stay in bounds
	position.y = clamp(position.y, 0, 600 -
	$Sprite2D.texture.get_height())

# bounces ball off paddle
func _on_area_2d_body_entered(body):
	body.direction.x *= -1
