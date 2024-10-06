extends Node2D

@export var text_speed = 25
var dialogue
var portrait
var text
var initialized = false
var typing = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = get_node("Textbox/Textbg/Text")
	portrait = get_node("Textbox/Portrait")
	visible = false

func _input(event):
	if event is InputEventKey:
		if event.pressed && (event.keycode == KEY_SPACE || event.keycode == KEY_ENTER): 
			if initialized:
				if ! await advance():
					visible = false
					initialized = false
		
func load_text(address): 
	
	var file = FileAccess.open(address, FileAccess.READ)
	var content = file.get_as_text(true).split("\n", false)
	
	return content

func initialize(address):
	position = get_viewport().get_camera_2d().get_screen_center_position() + Vector2(0,200)
	dialogue = load_text(address)
	visible = true
	initialized = true
	
	advance()
	
func advance():
	if (typing): return true
	typing = true
	if (dialogue.is_empty()): 
		typing = false
		return false
	
	var name = dialogue[0].split(";")[0];
	var speech = dialogue[0].split(";")[1];
	
	match name:
		_: 
			change_portrait("mc")
	
	var display = ""
	text.text = display
	
	for char in speech:
		display += char
		text.text = display
		await get_tree().create_timer(1.0/text_speed).timeout
		
	dialogue = dialogue.slice(1)
	typing = false
	return true

func change_portrait(file):
	var path = "res://assets/art/ui/" + file + ".png"
	portrait.texture = load(path)
