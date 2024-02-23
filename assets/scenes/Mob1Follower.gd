extends PathFollow2D

@export var RunSpeed = 150

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Makes the mob move along the path
	set_progress(get_progress() + RunSpeed * delta)
	
	if(loop == false and get_progress_ratio() == 1):
		queue_free()
