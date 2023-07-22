extends Node

var music_stream = preload("res://assets/kenney-interface-sounds/drop_003.ogg")
var button_hover_stream = preload("res://assets/kenney-interface-sounds/simple-piano-melody-9834.mp3")

var volume_db = -20

var music_audio_player: AudioStreamPlayer
var button_hover_audio_player: AudioStreamPlayer

func _ready():
	# button hover
	button_hover_audio_player = AudioStreamPlayer.new()
	button_hover_audio_player.stream = music_stream
	button_hover_audio_player.volume_db = volume_db
	# music
	music_audio_player = AudioStreamPlayer.new()
	music_audio_player.volume_db = volume_db
	music_audio_player.stream = button_hover_stream
	music_audio_player.autoplay = true
	
	get_tree().root.call_deferred("add_child", button_hover_audio_player)
	get_tree().root.call_deferred("add_child", music_audio_player)
	
	
func play_button_hover_sound():
	print("play button hover sound")
	button_hover_audio_player.play()
