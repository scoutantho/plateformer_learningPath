extends CharacterBody2D

const SPEED = 300.0
@onready var killzone =  $Killzone
func _physics_process(delta: float) -> void:	
	velocity += get_gravity() * delta
	velocity.x = SPEED

	move_and_slide()


func _on_damage_box_body_entered(body: Node2D) -> void:
	if body.name == "Player" and killzone.has_died: #issue has_died set as false by default
		return

	queue_free()
