extends PathFollow2D

var runSpeed = 150

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var newOffset = get_progress() + runSpeed * delta
	
	set_progress(newOffset)
	
	if (get_progress_ratio() == 1):
		queue_free()
	
