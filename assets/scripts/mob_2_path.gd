extends Path2D

@onready var path_follow : PathFollow2D = $PathFollow2D
#will be speed in px per second
@export var speed = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	path_follow.progress += speed * delta
	if $PathFollow2D/RigidBody2D :
		$PathFollow2D/RigidBody2D.global_position = $PathFollow2D/RigidBody2D.global_position
	else : queue_free()
