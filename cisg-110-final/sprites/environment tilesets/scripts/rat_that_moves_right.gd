extends RigidBody2D

@export var _speed: float = 50.0
func _physics_process(delta: float) -> void:
	linear_velocity.x = +_speed
	
	move_and_collide(linear_velocity * delta)
