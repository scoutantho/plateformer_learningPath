extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player = get_tree().get_first_node_in_group("Player")

func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	#play a loading scene and then change the scene to the next one 
	#add scne loading to the tree, with a size of 100% of the screen and a black color, then change the scene at the end of the timer
	# var scene = preload("res://Scenes/loading.tscn")
	# var instance = scene.instantiate()
	#var _interactionArea = instance.get_node("InteractionArea")
		# Assuming "InteractionArea" node exists in the scene
	#set size of instance to 100% of the screen
	# scene = get_viewport_rect().size
	# get_tree().root.add_child(instance)
	player.isLocked = true
	$Timer.start()
	

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/Scene2.tscn")
	# get_tree().change_scene("res://Scenes/Level2.tscn")
