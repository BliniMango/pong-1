extends Area2D

@export var main_scene_path: NodePath

func _on_body_entered(body: Node):
	if body is CharacterBody2D:
		var main_scene = get_node(main_scene_path)
		main_scene.tally_points("left")
		body.position = Vector2(400, 300)
		body.velocity = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized() * body.speed
