extends RigidBody2D

@export var hp = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	var missile1_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(missile1_types[1])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func explode():
	set_mass(0)
	set_gravity_scale(0)
	set_linear_velocity(Vector2(0, 0))
	var missile1_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(missile1_types[0])
	
func hit():
	hp -= 1
	if hp <= 0:
		set_collision_layer_value(1, false)
		set_collision_layer_value(2, false)
		explode()
	
func _on_animated_sprite_2d_animation_finished():
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
