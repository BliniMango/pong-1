extends StaticBody2D

@export var speed: float = 400
@export var ball_path: NodePath

var ball: CharacterBody2D
var direction

func _ready():
	ball = get_node(ball_path)

func _process(delta):
	if ball.position.y > position.y + $Sprite2D.texture.get_height() / 2:
		position.y += speed * delta
	elif ball.position.y < position.y - $Sprite2D.texture.get_height() / 2:
		position.y -= speed * delta
	# to ensure the paddle stays within bounds
	position.y = clamp(position.y, 0, 600 - $Sprite2D.texture.get_height())

# bounces ball off cpu paddle
func _on_area_2d_body_entered(body):
	body.direction.x *= -1
