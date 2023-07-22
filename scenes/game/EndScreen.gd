extends CanvasLayer


func end_game(score: int, new_high_score: bool, win: bool):
	$Transition.visible = true
	$Transition/AnimationPlayer.connect("animation_finished", self, "_animation_finished")
	$Transition/AnimationPlayer.play("FadeOut")
	$EndScreen/Score.text = "SCORE: " + str(score)
	if win:
		$EndScreen/Title.text = "YOU WON - CONGRATULATIONS!"
		$EndScreen/Subtitle.text = "Harvested all crops without disturbing any monsters"

func _animation_finished(_arg):
	print("Animation finished")
	$EndScreen.visible = true
