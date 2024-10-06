extends Label

var time_left: float = 25.0  
var time_left_int: int
signal time_end

func _process(delta):
	if time_left > 0:
		time_left -= delta
		time_left_int = int(time_left)
		text = "Time left: %d" % time_left_int
	else:
		text = "Time's up!" 
		time_end.emit()
