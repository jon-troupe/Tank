extends RigidBody2D

@export var hp = 50
@export var green_laser: PackedScene
var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	go_left()
	$AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer = timer + delta
	
	
	# Movement logic
	if position.x < 400:
		go_right()
	
	if position.x > 600:
		go_left()
	
	# Calls laser to attack on a timer
	if timer >= 2: 
		laser()

func laser():
	# Shoots main laser barrage
		var laser1 = green_laser.instantiate()
		laser1.position = $Marker2D.position
		laser1.set_linear_velocity(Vector2(0, 500))
		add_child(laser1)
		
		var laser2 = green_laser.instantiate()
		laser2.position = $Marker2D2.position
		laser2.set_linear_velocity(Vector2(0, 500))
		add_child(laser2)
		
		var laser3 = green_laser.instantiate()
		laser3.position = $Marker2D3.position
		laser3.set_linear_velocity(Vector2(0, 500))
		add_child(laser3)
		
		var laser4 = green_laser.instantiate()
		laser4.position = $Marker2D4.position
		laser4.set_linear_velocity(Vector2(0, 500))
		add_child(laser4)
		
		timer = 0

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

func go_left():
	set_linear_velocity(Vector2(-100, 0))

func go_right():
	set_linear_velocity(Vector2(100, 0))
