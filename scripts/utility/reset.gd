extends Area2D

var original_positions = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for body in get_tree().get_nodes_in_group("pushable"):
		original_positions[body] = body.global_position


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		for b in original_positions.keys():
			if b:
				b.global_position = original_positions[b]
		var image = Image.load_from_file("res://resources/tiles/button.png")
		var texture = ImageTexture.create_from_image(image)
		get_node("Sprite2D").texture = texture


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		var image = Image.load_from_file("res://resources/tiles/button(1).png")
		var texture = ImageTexture.create_from_image(image)
		get_node("Sprite2D").texture = texture
