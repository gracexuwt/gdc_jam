extends Label

var time_left: float = 60.0  


func _process(delta):
	if time_left > 0:
		time_left -= delta
		text = str(round(time_left, 2))  # Update the Label text to show the timer
	else:
		text = "Time's up!"  # Change the text when the timer ends
