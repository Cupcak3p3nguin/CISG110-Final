extends RigidBody2D

@export var _speed: float = 50.0
func _physics_process(delta: float) -> void:
	linear_velocity.x = -_speed
	
	move_and_collide(linear_velocity * delta)

@export var _explosion_VFX: CPUParticles2D

var _was_kicked: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_contacts_reported = 3
	contact_monitor = true

func _on_body_shape_entered(body_rid: RID, body: Node, body_shape_index: int, local_shape_index: int) -> void:
	if _was_kicked:
		_explosion_VFX.emitting = true
		
		_explosion_VFX.reparent(get_parent())
		
		queue_free()
