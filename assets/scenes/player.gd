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
	$AnimatedSprite2D.play()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	cooldown_timer = cooldown_timer + delta
	
	# Player shooting
	if Input.is_action_pressed("shoot"):
		if cooldown_timer >= 0.4:
			shoot()
			cooldown_timer = 0

	# Player movement, changes animation speed appropriately for wheel movement when pressed and back to idle when released
	var player_velocity = Vector2.ZERO 
	if Input.is_action_pressed("move_right"):
		player_velocity.x += 1
		$AnimatedSprite2D.speed_scale = 2
	if Input.is_action_just_released("move_right"):
		$AnimatedSprite2D.speed_scale = 1
	if Input.is_action_pressed("move_left"):
		player_velocity.x -= 1
		$AnimatedSprite2D.speed_scale = -1
	if Input.is_action_just_released("move_left"):
		$AnimatedSprite2D.speed_scale = 1
		
	# Player movement animation + speed
	if player_velocity.x > 0 || player_velocity.x < 0:
		player_velocity = player_velocity.normalized() * speed
	position += player_velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

func shoot():
	#Spawn and position missile to the middle of the tank
	var newBullet = bullet.instantiate()
	newBullet.transform = get_node("Gun/Marker2D").global_transform
	owner.add_child(newBullet)

func _on_body_entered(body):
	hide() # Player disappears after being hit.
	hit.emit()
	body.explode()
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false 

