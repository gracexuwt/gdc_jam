extends Node2D

var coins: int = 0
var won = false

func _ready():
	for coin in get_tree().get_nodes_in_group("coin"):
		coin.connect("collected", Callable(self, "_on_coin_collected"))

func _process(delta: float) -> void:
	if not won:
		if coins >= 10:
			won = true
			# cutscene here
	pass

func _on_coin_collected():
	coins += 1
	update_score()

func update_score():
	get_node("BoxContainer2/ScoreLabel").text = "Coins Collected: %d" % coins
