extends CharacterBody2D

signal show_portal

func _ready():
	get_node("AnimatedSprite2D").visible = false
	get_node("CollisionShape2D").disabled = true

func _process(delta):
	check_hounds()


func check_hounds():
	var all_true = true
	for obj in get_tree().get_nodes_in_group("hound"):
		if not obj.caged:
			all_true = false
			break
	if all_true:
		show_cat()
		
func show_cat():
	get_node("AnimatedSprite2D").visible = true
	get_node("CollisionShape2D").disabled = false
	show_portal.emit()
