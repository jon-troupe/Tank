extends Path2D

# All possible helicopters loaded up 
@export var mob1: PackedScene
@export var mob2: PackedScene
@export var mob3: PackedScene

var timer = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer = timer + delta
	if timer >= 3 :
		spawn_mob()
		timer = 0
		
func spawn_mob():
	# Place all helicopters in an array
	var mob_array = [mob1, mob2, mob3]
	# Picks a mob from the array to randomly spawn
	var mob = mob_array.pick_random().instantiate()
	
	#Choose a random spot on the path2D
	var mob_spawn_location = $PathFollow2D
	mob_spawn_location.progress_ratio = randf()
	
	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position
	
	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(-150.0, -250.0), 0.0)
	mob.linear_velocity = velocity
	
	add_child(mob)
