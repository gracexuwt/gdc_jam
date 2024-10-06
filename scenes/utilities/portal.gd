extends Area2D

@export var scene_path : String
@export var isEnd : bool

signal change

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if isEnd:
		# set visibility and enable collision in scene script
		get_node("AnimatedSprite2D").visible = false
		get_node("CollisionShape2D").disabled = true
		get_node("AnimatedSprite2D").play()
	else:
		get_node("AnimatedSprite2D").play()
		await get_tree().create_timer(2).timeout
		self.free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass	
			
func showPortal():
	get_node("AnimatedSprite2D").visible = true
	get_node("CollisionShape2D").disabled = false


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and isEnd:
		change.emit()
		
