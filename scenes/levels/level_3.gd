extends Node2D

var coins: int = 0
var won = false
var time_end = false
var timer

func _ready():
	for coin in get_tree().get_nodes_in_group("coin"):
		coin.connect("collected", Callable(self, "_on_coin_collected"))
	timer = get_node("Timer")
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))

func _process(delta: float) -> void:
	#after cutscene here
	timer.start()
	if not won:
		if coins >= 10 and not time_end:
			won = true
			# cutscene here
	pass

func _on_coin_collected():
	coins += 1
	update_score()

func update_score():
	get_node("BoxContainer2/ScoreLabel").text = "Coins Collected: %d" % coins
	
func _on_timer_timeout():
	time_end = true
