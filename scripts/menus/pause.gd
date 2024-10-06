extends Control

var is_paused = false

onready var pause_screen = $pause

# show pause screen when assets are ready 
func _ready():
	pause_screen.visible = false
	
# pauses game when esc is pressed 
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		toggle_pause()

# toggles between paused and unpaused 
func toggle_pause():
	is_paused = !is_paused # toggles pause states 
	
	if is_paused:
		pause_game()
	else:
		resume_game()

# opens the pause menu  
func pause_game():
	get_tree().paused = true 
	pause_screen.visible = true

# resumes game 
func resume_game():
	get_tree().paused = false
	pause_screen.visible = false

# save game 
# func _on_save_button_pressed():

# exits to title screen 
func _on_exit_button_pressed(): 
	get_tree().change_scene_to_file("res://scenes/menus/title_screen.tscn")

# opens help page 
func _on_help_button_pressed():
	get_tree().change_scene_to_file("")

# opens settings 
func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/settings.tscn")

# opens credits 
func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/credits.tscn")
