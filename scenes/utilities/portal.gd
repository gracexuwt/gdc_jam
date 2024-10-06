extends Area2D

@export var scene_path : String
@export var isRight : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if isRight:
		get_node("AnimatedSprite2D").play("right_appear")
		get_node("AnimatedSprite2D").play("right_rotate")
	else:
		get_node("AnimatedSprite2D").play("left_appear")
		get_node("AnimatedSprite2D").play("left_rotate")
		var player = get_tree().get_nodes_in_group("player")
		if player:
			player.movePortal()
		get_node("AnimatedSprite2D").play("left_disappear")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if isRight:
			get_node("AnimatedSprite2D").play("right_disappear")
			get_tree().change_scene_to_file(scene_path)
