extends RigidBody2D

@export var hp = 2
var timer = 0
var spawnTime = 4

@export var missile : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	var mob1_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob1_types[0])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer = timer + delta 
	
	# Spawns the enemy every set interval then resets timer
	if(timer > spawnTime):
		var newMissile = missile.instantiate()
		owner.add_child(newMissile)
		timer = 2

func hit():
	hp -= 1
	if hp <= 0:
		queue_free()
