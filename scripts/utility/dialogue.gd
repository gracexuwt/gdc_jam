extends Node2D

@export var text_speed = 25
var dialogue
var text

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = get_node("%Text")
	initialize("res://assets/text/test_text.txt")
	advance()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_text(address): 
	
	var file = FileAccess.open(address, FileAccess.READ)
	var content = file.get_as_text(true).split("\n")
	
	return content

func initialize(address):
	dialogue = load_text(address)
	
func advance():
	var name = dialogue[0].split(";")[0];
	var speech = dialogue[0].split(";")[1];
	
	var display = ""
	text.text = display
	
	for char in speech:
		display += char
		text.text = display
		await get_tree().create_timer(1.0/text_speed).timeout
	
	dialogue.remove_at(0);
	
	
	
