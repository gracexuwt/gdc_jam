extends Area2D

@export var animate_upon_load : bool
var caged = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if animate_upon_load:
		get_node("AnimatedSprite2D").play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("pushable"):
		get_node("AnimatedSprite2D").stop()
		caged = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("pushable"):
		get_node("AnimatedSprite2D").play()
		get_node("AudioStreamPlayer2D").play()
		caged = false
