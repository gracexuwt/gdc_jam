extends Node

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/tutorial.tscn")
	pass


func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/settings.tscn")
	pass


func _on_exit_button_pressed():
	get_tree().quit()
	pass 


func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/credits.tscn")
	pass
