extends Cage
class_name CagePhysics


func push(velocity: Vector2) -> void:
	move_and_collide(velocity)
