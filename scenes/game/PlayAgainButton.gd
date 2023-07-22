extends TextureButton


func _on_PlayAgainButton_mouse_entered():
	AudioManager.play_button_hover_sound()
	self.rect_scale = Vector2(1.2,1.2)


func _on_PlayAgainButton_mouse_exited():
	self.rect_scale = Vector2(1,1)


func _on_PlayAgainButton_pressed():
	get_tree().change_scene("res://scenes/titlescreen/Titlescreen.tscn")
