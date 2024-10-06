extends Area2D

@export var card_num : int
@export var path : String
var isFlip = false
var isMatch = false

var card_back
var card_front

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	card_back = preload("res://assets/art/objects/card_back.png")
	card_front = Image.load_from_file(path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var texture = ImageTexture.create_from_image(card_front)
		if get_node("Sprite2D").texture != texture:
			get_node("Sprite2D").texture = texture
		isFlip = true
