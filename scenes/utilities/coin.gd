extends Area2D
	
	
signal collected
	
func _ready():
	get_node("AnimatedSprite2D").play()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		collected.emit()
		queue_free()
