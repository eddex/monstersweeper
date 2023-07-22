extends Label


func _ready():
	text = "HIGH SCORE: " + str(GameState.high_score)
