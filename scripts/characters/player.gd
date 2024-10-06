extends CharacterBody2D
class_name Player

@export var movement_speed = 200
var screen_size

# Called when the node enterss the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * movement_speed
		if(velocity.x != 0 && velocity.y != 0):
			get_node("AnimatedSprite2D").stop()
		elif velocity.x > 0:
			get_node("AnimatedSprite2D").play("walk_right")
		elif velocity.x < 0:
			get_node("AnimatedSprite2D").play("walk_left")
		elif velocity.y > 0:
			get_node("AnimatedSprite2D").play("walk_down")
		else:
			get_node("AnimatedSprite2D").play("walk_up")
	else:
		get_node("AnimatedSprite2D").stop()
		
	# Update position
	move_and_collide(velocity * delta)
	position = position.clamp(Vector2.ZERO, screen_size)
	
func movePortal():
	var velocity = Vector2.ZERO
	velocity.x += 1
	move_and_collide(velocity)
