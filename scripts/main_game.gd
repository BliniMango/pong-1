extends Node2D

var left_score: int = 0
var right_score: int = 0


func ready():
	$LeftScore.connect("body_entered", Callable(self, "_on_left_score_body_entered"))
	$RightScore.connect("body_entered", Callable(self, "_on_right_score_body_entered"))
	
# tally scores
func tally_points(side: String):
	if side == "left":
		left_score += 1
	elif side == "right":
		right_score += 1
	update_score_labels()
	
func update_score_labels():
	$CanvasLayer/PlayerScore.text = str(right_score)
	$CanvasLayer/CPUScore.text = str(left_score)

# goalies
func _on_left_score_body_entered(body):
	body.queue_free()
	var ball_respawn = preload("res://scenes/ball.tscn").instantiate()
	ball_respawn.global_position = Vector2(576, 324)
	add_child(ball_respawn)
	
	tally_points("right")

func _on_right_score_body_entered(body):
	var ball_respawn = preload("res://scenes/ball.tscn").instantiate()
	ball_respawn.global_position = Vector2(576, 324)
	add_child(ball_respawn)
	
	tally_points("left")

# boarder collison detection
func _on_top_boarder_body_entered(body):
	body.direction.y *= -1
	
func _on_bottom_boarder_body_entered(body):
	body.direction.y *= -1
