extends Sprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_position = get_global_mouse_position()
	if mouse_position[1] < 452:
		look_at(mouse_position)
	
