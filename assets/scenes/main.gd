extends Node

@export var boss_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game() 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func new_game():
	$Player.start($StartPosition.position)
	$StartTimer.start()

func _on_start_timer_timeout():
	$BossTimer.start() 

func _on_boss_timer_timeout():
	var boss = boss_scene.instantiate()
	boss.position = $Marker2D.position
	add_child(boss)
	$BossTimer.stop()

func game_over():
	$Player.queue_free()
	$BossTimer.stop()
	$StartTimer.stop()
