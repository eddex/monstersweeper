tool
extends TileMap

var offset = Vector2(0, -388)

export(bool) var UpdateOffsets setget _update_offsets

func _ready():
	_update_offsets(true)

# make tiles appear where the mouse is pointing in the editor
func _update_offsets(_arg):
	for tile_id in tile_set.get_tiles_ids():
		tile_set.tile_set_texture_offset(tile_id, offset)
