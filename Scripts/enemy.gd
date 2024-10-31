extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta: float) -> void:	
	velocity += get_gravity() * delta
	velocity.x = SPEED

	move_and_slide()


func _on_damage_box_body_entered(_body: Node2D) -> void:
	print("i die ?")
	queue_free()
	pass # Replace with function body.
