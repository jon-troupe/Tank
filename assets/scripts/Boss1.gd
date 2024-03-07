extends RigidBody2D

@export var hp = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func hit():
	# Reduces HP and checks if it dies
	hp -= 1
	if hp <= 0:
		queue_free()
