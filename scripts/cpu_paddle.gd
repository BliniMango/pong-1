extends StaticBody2D

@export var speed: float = 300
@export var ball_path: NodePath

var ball: RigidBody2D

func _ready():
	ball = get_node(ball_path)

func _process(delta):
	if ball.position.y > position.y + $Sprite2D.texture.get_height() / 2:
		position.y += speed * delta
	elif ball.position.y < position.y - $Sprite2D.texture.get_height() / 2:
		position.y -= speed * delta
	# To ensure the paddle stays within bounds
	position.y = clamp(position.y, 0, 600 - $Sprite2D.texture.get_height())
