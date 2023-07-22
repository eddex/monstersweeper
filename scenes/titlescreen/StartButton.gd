extends TextureButton


func _on_StartButton_mouse_entered():
	AudioManager.play_button_hover_sound()
	self.rect_scale = Vector2(1.2,1.2)


func _on_StartButton_mouse_exited():
	self.rect_scale = Vector2(1,1)


func _start_game():
	get_tree().change_scene("res://scenes/game/Game.tscn")


func _on_StartButtonEasy_pressed():
	GameState.difficulty = 0.05
	_start_game()


func _on_StartButtonMedium_pressed():
	GameState.difficulty = 0.1
	_start_game()


func _on_StartButtonHard_pressed():
	GameState.difficulty = 0.15
	_start_game()
