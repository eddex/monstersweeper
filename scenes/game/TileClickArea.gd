extends Area2D

signal tile_clicked(cell_pos, area)

var cell_pos: Vector2

func _ready():
	$AnimationDeferringTimer.wait_time = cell_pos.x / 2 + 1
	$AnimationDeferringTimer.start()
	
func initialize(cell_pos: Vector2):
	self.cell_pos = cell_pos
	
	
func set_bad_neighbors_count(count: int):
	$BadNeighborsLabel.text = str(count)
	if count == 0:
		$BadNeighborsLabel.add_color_override("font_color", Color.green)
	if count == 1:
		$BadNeighborsLabel.add_color_override("font_color", Color.yellow)
	if count == 2:
		$BadNeighborsLabel.add_color_override("font_color", Color.orange)
	if count == 3:
		$BadNeighborsLabel.add_color_override("font_color", Color.orangered)
	if count >=4:
		$BadNeighborsLabel.add_color_override("font_color", Color.red)
		

func _on_self_input_event(_viewport: Node, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		print("TileClickArea: ", event.global_position, cell_pos)
		emit_signal("tile_clicked", cell_pos, self)
		$CollisionPolygon2D.disabled = true # only clickable once


func _on_AnimationDeferringTimer_timeout():
	$AnimationPlayer.play("Float")
