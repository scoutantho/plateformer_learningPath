extends Area2D

# var has_died := false

func _on_body_entered(_body: Node2D) -> void:
	
	if Globals.player_hasDied:
		return
	Globals.player_hasDied = true
	print("you die!")
	$Timer.start()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	Globals.player_hasDied = false
