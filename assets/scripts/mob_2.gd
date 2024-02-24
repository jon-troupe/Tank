extends RigidBody2D

@export var hp = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func hit():
	print("test")
	hp -= 1
	if hp <= 0:
		queue_free()
