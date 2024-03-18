extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func explode():
	$CollisionPolygon2D.set_deferred("disabled", true)
	set_mass(0.1)
	set_gravity_scale(0)
	set_linear_velocity(Vector2(0, 0))
	queue_free()
