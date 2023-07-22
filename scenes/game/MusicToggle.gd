extends Label

var sound_on = preload("res://assets/kenney-ui-pack/red_boxCheckmark.png")
var sound_off = preload("res://assets/kenney-ui-pack/red_boxCross.png")

func _ready():
	_set_button_texture()


func _on_SoundSettingButton_pressed():
	AudioManager.toggle_sound_on_off()
	_set_button_texture()


func _set_button_texture():
	$SoundSettingButton.texture_normal = sound_on if AudioManager.sound_on else sound_off
