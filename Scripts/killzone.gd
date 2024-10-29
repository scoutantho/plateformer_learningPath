extends Area2D

var has_died := false

func _on_body_entered(_body: Node2D) -> void:
	if has_died:
		return
	has_died = true
	print("you die!")
	$Timer.start()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	has_died = false