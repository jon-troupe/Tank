extends Node

@export var mob_scene: PackedScene
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game() 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func game_over():
	$MobTimer.stop() 

func new_game():
	$Player.start($StartPosition.position)
	$StartTimer.start()

func _on_start_timer_timeout():
	$MobTimer.start() 
