extends Node2D

var coins: int = 0
var won = false
var time_end = false

func _ready():
	for coin in get_tree().get_nodes_in_group("coin"):
		coin.connect("collected", Callable(self, "_on_coin_collected"))
	get_node("BoxContainer2/TimeLabel").connect("time_end", Callable(self, "_on_timer_timeout"))

func _process(delta: float) -> void:
	#after cutscene here
	#timer.start()
	if not won:
		if coins >= 10 and not time_end:
			won = true
			print("success")
			# cutscene here
			get_node("Portal2").showPortal()
	pass

func _on_coin_collected():
	coins += 1
	
func _on_timer_timeout():
	time_end = true
