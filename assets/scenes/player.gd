extends Area2D

# Tank
signal hit
@export var speed = 200
var screen_size

# Bullets
@export var bullet: PackedScene
var cooldown_timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	cooldown_timer = cooldown_timer + delta
	
	# Player looking
	var mouse_position = get_global_mouse_position()
	if mouse_position[1] < 452:
		look_at(mouse_position)
	
	# Player shooting
	if Input.is_action_pressed("shoot"):
		if cooldown_timer >= 0.4:
			shoot()
			cooldown_timer = 0

	# Player movement
	var player_velocity = Vector2.ZERO 
	if Input.is_action_pressed("move_right"):
		player_velocity.x += 1
	if Input.is_action_pressed("move_left"):
		player_velocity.x -= 1
		
		
	# Player movement animation + speed
	if player_velocity.x > 0 || player_velocity.x < 0:
		player_velocity = player_velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	position += player_velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

func shoot():
	#Spawn and position missile to the middle of the tank
	var newBullet = bullet.instantiate()
	newBullet.transform = get_node("Marker2D").global_transform
	owner.add_child(newBullet)

func _on_body_entered(body):
	hide() # Player disappears after being hit.
	hit.emit()
	body.explode()
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)
	pass
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false 

