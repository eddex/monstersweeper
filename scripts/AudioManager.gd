extends Node

var button_hover_stream = preload("res://assets/kenney-interface-sounds/drop_003.ogg")
var music_stream = preload("res://assets/simple-piano-melody-9834.mp3")
var harvest_stream = preload("res://assets/crunch.4.ogg")
var monster_stream = preload("res://assets/monster-12.wav")

var volume_db = -20

var sound_on: bool = true

var music_audio_player: AudioStreamPlayer
var button_hover_audio_player: AudioStreamPlayer
var harvest_audio_player: AudioStreamPlayer
var monster_audio_player: AudioStreamPlayer

func _ready():
	# button hover
	button_hover_audio_player = AudioStreamPlayer.new()
	button_hover_audio_player.stream = button_hover_stream
	button_hover_audio_player.volume_db = volume_db
	# harvest
	harvest_audio_player = AudioStreamPlayer.new()
	harvest_audio_player.stream = harvest_stream
	harvest_audio_player.volume_db = volume_db * 2
	harvest_audio_player.pitch_scale = 0.9
	# monster
	monster_audio_player = AudioStreamPlayer.new()
	monster_audio_player.stream = monster_stream
	monster_audio_player.volume_db = volume_db
	monster_audio_player.pitch_scale = 0.9
	# music
	music_audio_player = AudioStreamPlayer.new()
	music_audio_player.volume_db = volume_db
	music_audio_player.stream = music_stream
	music_audio_player.autoplay = true
	
	get_tree().root.call_deferred("add_child", button_hover_audio_player)
	get_tree().root.call_deferred("add_child", music_audio_player)
	get_tree().root.call_deferred("add_child", harvest_audio_player)
	get_tree().root.call_deferred("add_child", monster_audio_player)
	
	
func play_button_hover_sound():
	button_hover_audio_player.play()


func play_harvest_sound():
	harvest_audio_player.play()


func play_monster_sound():
	monster_audio_player.play()


func toggle_sound_on_off():
	sound_on = !sound_on
	if sound_on:
		music_audio_player.play()
	else:
		music_audio_player.stop()
