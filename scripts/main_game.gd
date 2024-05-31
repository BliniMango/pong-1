extends Node2D

var left_score: int = 0
var right_score: int = 0


func ready():
	$LeftScore.connect("body_entered", Callable(self, "_on_left_score_body_entered"))
	$RightScore.connect("body_entered", Callable(self, "_on_right_score_body_entered"))

func tally_points(side: String):
	if side == "left":
		left_score += 1
	elif side == "right":
		right_score += 1
	update_score_labels()
	
func update_score_labels():
	$CanvasLayer/PlayerScore.text = str(right_score)
	$CanvasLayer/CPUScore.text = str(left_score)
	
func _on_left_score_body_entered(body):
	tally_points("right")

func _on_right_score_body_entered(body):
	tally_points("left")
