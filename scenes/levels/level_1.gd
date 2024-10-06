extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for p in get_tree().get_nodes_in_group("portal"):
		p.connect("change", Callable(self, "_on_change"))
	get_node("Cat").connect("show_portal", Callable(self, "_on_show_portal"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_show_portal():
	get_node("Portal2").showPortal()

func _on_change():
	get_tree().change_scene_to_file("res://scenes/levels/level2.tscn")
