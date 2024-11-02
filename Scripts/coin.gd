extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_coin_body_entered(body:Node2D) -> void:
	if(body.is_in_group('Player')):
		print("coin collected")
		# animatedSprite.play("collected")
		# $CollisionShape2D.disabled = true
		GameManager.coins += 1
		queue_free()
		# $Timer.start()
	pass # Replace with function body.
