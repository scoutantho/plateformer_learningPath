extends Area2D

# var has_died := false

func _on_body_entered(_body: Node2D) -> void:
	
	if GeneralGame.player_hasDied:
		return
	GeneralGame.player_hasDied = true
	print("you die!")
	$Timer.start()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	GeneralGame.player_hasDied = false
