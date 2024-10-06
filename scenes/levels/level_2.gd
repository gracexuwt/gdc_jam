extends Node

var first_card = 0
var first_card_obj
var success_matches = 0

@onready var card_back = preload("res://assets/art/objects/card_back.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if success_matches >= 8:
		print("success")
	else:
		for card in get_tree().get_nodes_in_group("card"):
			if card.isMatch:
				continue
			elif card.isFlip:
				if first_card != 0 && card != first_card_obj:
					checkCard(card)
					first_card = 0
				else:
					first_card = card.card_num
					first_card_obj = card


func checkCard(card: Area2D):
	if card.card_num == first_card:
		# match success
		success_matches += 1
		first_card_obj.isMatch = true
		card.isMatch = true	
	else:
		await get_tree().create_timer(0.8).timeout
		first_card_obj.isFlip = false
		card.isFlip = false
		first_card_obj.get_node("Sprite2D").texture = card_back
		card.get_node("Sprite2D").texture = card_back
