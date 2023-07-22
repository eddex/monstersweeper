extends Node2D

var corn_cell_positions: Array
var tile_click_area_scene = preload("res://scenes/game/TileClickArea.tscn")
var corn_cell_states: Dictionary = {} # Vector2 to bool
var corn_cell_bad_neighbors: Dictionary = {} # Vector2 to int
var good_cells_left: int
var score = 0

func _ready():
	_initialize_clickable_areas()
	_initialize_game()
	_initialize_ui()


func _initialize_ui():
	$GameUI/HighScore.text = "HIGH SCORE: " + str(GameState.high_score)


func _initialize_game():
	for corn_cell_pos in corn_cell_positions:
		# 10% change of being a "monster cell" = game over
		var is_bad_cell = rand_range(0, 1) < GameState.difficulty
		corn_cell_states[corn_cell_pos] = is_bad_cell
		if !is_bad_cell:
			good_cells_left += 1
	print("Good cells: " + str(good_cells_left) + ", Bad cells: " + str(len(corn_cell_positions)-good_cells_left))


func _initialize_clickable_areas():
	corn_cell_positions = $PlantsTileMap.get_used_cells()
	for corn_cell_pos in corn_cell_positions:
		var tile_click_area = tile_click_area_scene.instance()
		tile_click_area.position = $PlantsTileMap.map_to_world(corn_cell_pos) + Vector2(0, -64)
		tile_click_area.initialize(corn_cell_pos)
		tile_click_area.connect("tile_clicked", self, "_tile_clicked")
		add_child(tile_click_area)


func _tile_clicked(cell_pos: Vector2, area: Area2D):
	print("tile_clicked signal received: ", cell_pos)
	var current_cell_tile = $PlantsTileMap.get_cellv(cell_pos)
	print(current_cell_tile)
	$PlantsTileMap.set_cellv(cell_pos, current_cell_tile+3)
	if corn_cell_states[cell_pos]:
		print("--- GAME OVER ---")
		$EndScreen.end_game(score, score == GameState.high_score, false)
	else:
		print("Cell harvested")
		_increase_score()
		_handle_win()
		var neighbor_cells = [
			cell_pos+Vector2(-1, -1), #N
			cell_pos+Vector2(0, -1), #NE
			cell_pos+Vector2(-1, 0), #NW
			cell_pos+Vector2(1, -1), #E
			cell_pos+Vector2(-1, 1), #W
			cell_pos+Vector2(1, 1), #S
			cell_pos+Vector2(1, 0), #SE
			cell_pos+Vector2(0, 1), #SW
		]
		var bad_neighbors = 0
		for neighbor_cell in neighbor_cells:
			var is_bad = _is_cell_bad(neighbor_cell)
			if is_bad:
				bad_neighbors += 1
		print("Bad neighbors for ", cell_pos, ":", bad_neighbors)
		area.set_bad_neighbors_count(bad_neighbors)


func _increase_score():
	score += GameState.difficulty * 5000
	$GameUI/Score.text = "SCORE: " + str(score)
	if GameState.high_score < score:
		GameState.high_score = score
		$GameUI/HighScore.text = "HIGH SCORE: " + str(score)

func _handle_win():
	good_cells_left -= 1
	if good_cells_left <= 0:
		$EndScreen.end_game(score, score == GameState.high_score, true)

func _is_cell_bad(cell_pos: Vector2):
	if corn_cell_states.has(cell_pos):
		return corn_cell_states[cell_pos]
