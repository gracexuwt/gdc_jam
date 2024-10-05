extends CharacterBody2D
class_name Cage

var pushing = false
var horizontal = false
var direction = 0

func _process(delta):
	if pushing and horizontal:
		velocity.x = direction * delta * 128
	elif pushing:
		velocity.y = direction * delta * 128
	else:
		velocity.x = 0
		velocity.y = 0
	move_and_collide(velocity)

func _on_right_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("player"):
		direction = 1
		horizontal = true
		pushing = true


func _on_right_body_exited(body: CharacterBody2D) -> void:
	if body.is_in_group("player"):
		direction = 0
		pushing = false


func _on_left_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("player"):
		direction = -1
		horizontal = true
		pushing = true


func _on_left_body_exited(body: CharacterBody2D) -> void:
	if body.is_in_group("player"):
		direction = 0
		pushing = false


func _on_up_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("player"):
		direction = -1
		horizontal = false
		pushing = true


func _on_up_body_exited(body: CharacterBody2D) -> void:
	if body.is_in_group("player"):
		direction = 0
		pushing = false


func _on_bottom_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("player"):
		direction = 1
		horizontal = false
		pushing = true


func _on_bottom_body_exited(body: CharacterBody2D) -> void:
	if body.is_in_group("player"):
		direction = 0
		pushing = false
