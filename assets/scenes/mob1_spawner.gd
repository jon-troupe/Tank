extends Path2D

var timer = 0
var spawnTime = 5
var follower = load("res://assets/scenes/paths/mob_1_follower.tscn")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer = timer + delta
	
	# Spawns the enemy every set interval then resets timer
	if(timer > spawnTime):
		var newFollower = follower.instantiate()
		add_child(newFollower)
		timer = 0
		newFollower = null
