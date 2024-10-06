extends CharacterBody2D
class_name Player

@export var movement_speed = 200
var screen_size
var last_input
var moveable = true

# Called when the node enterss the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_node("%Dialogue")):
		moveable = false
		return		
	
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		velocity.x += 1
		last_input = Vector2.RIGHT
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		last_input = Vector2.LEFT
	if Input.is_action_pressed("down"):
		velocity.y += 1
		last_input = Vector2.DOWN
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		last_input = Vector2.UP
	if velocity != Vector2.ZERO: moveable = true

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

	if moveable && (Input.is_key_pressed(KEY_SPACE) || Input.is_key_pressed(KEY_ENTER)):
		var query = PhysicsRayQueryParameters2D.create(position, position + last_input * 100)
		var result = get_world_2d().direct_space_state.intersect_ray(query)
		if !result.is_empty():
			result.get("collider").start_dialogue()
