extends Area2D

@export var speed = 200
var target = position

# Called when the node enters the scene tree for the first time.
func _ready():
	target = get_global_mouse_position()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.x * speed * delta
	
func _on_body_entered(body):
	body.hit()
