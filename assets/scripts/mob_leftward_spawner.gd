extends Path2D

@export var mob1: PackedScene
var timer = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer = timer + delta
	if timer >= 3 :
		spawn_mob()
		timer = 0
		
func spawn_mob():
	var mob = mob1.instantiate()
	
	#Choose a random spot on the path2D
	var mob_spawn_location = $PathFollow2D
	mob_spawn_location.progress_ratio = randf()
	
	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position
	
	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(-150.0, -250.0), 0.0)
	mob.linear_velocity = velocity
	
	add_child(mob)
