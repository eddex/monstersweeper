extends Panel


func _ready():
	if GameState.tutorial_seen:
		visible = false


func _on_CloseTutorialButton_pressed():
	GameState.tutorial_seen = true
	visible = false


func _on_CloseTutorialButton_mouse_entered():
	AudioManager.play_button_hover_sound()
	$CloseTutorialButton.rect_scale = Vector2(1.2,1.2)


func _on_CloseTutorialButton_mouse_exited():
	$CloseTutorialButton.rect_scale = Vector2(1,1)
