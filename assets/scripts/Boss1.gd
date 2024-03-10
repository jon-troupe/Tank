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
		$CollisionPolygon2D.set_deferred("disabled", true)
		queue_free()
	else:
		# Turns the sprite white and starts the timer to return it to normal
		$FlashTimer.start()
		$AnimatedSprite2D.self_modulate = Color(1,1,5,3)

func _on_flash_timer_timeout():
	$AnimatedSprite2D.self_modulate = Color(1,1,1,1)
