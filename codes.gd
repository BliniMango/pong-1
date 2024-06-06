extends Node #KinematicBody2D

@export var speed: float = 400  # Adjust for desired responsiveness
@export var ball_path: NodePath

var ball: Node # Changed type for consistency
var target_y: float

func _ready():
	ball = get_node(ball_path)

func _process(delta):
	# Calculate target position based on ball's Y position
	target_y = ball.position.y

	# Limit target position to playfield bounds (adjust values as needed)
	target_y = clamp(target_y, 0 + $Sprite2D.texture.get_height() / 2, get_viewport().rect.size.y - $Sprite2D.texture.get_height() / 2)

	# Move towards target position smoothly
	var movement = Vector2.ZERO
	movement.y = Vector2.UP * speed * delta.y - ball.position.y
	movement.y = sign(target_y - ball.position.y) * MIN(ABS(target_y - ball.position.y), ABS(movement.y))  # Smooth approach

	position += movement

# Bounces ball off CPU paddle (assuming Ball inherits KinematicBody2D)
func _on_PhysicsProcess(delta):
	if is_on_collider():
		var ball_collision = get_collider(0)
		if ball_collision is ball:
			ball.direction.x *= -1  # Reflect ball's X direction
			# Optionally adjust ball's Y direction based on collision point (advanced)
